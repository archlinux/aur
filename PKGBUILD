# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=93.6
_commit=c801bdb471789a2f7cf99ae74cd1aef5
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL2')
depends=('thunderbird')
conflicts=('thunderbird<113' 'thunderbird>=117')
#source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz")
source=("${url}/uploads/${_commit}/cardbook-${pkgver}-tb.xpi")
sha256sums=('99137f63ecca8efb68092b4844b2c420e67597657634d1a3faf58a242d238d54')

build() {
    #cd CardBook-${_commit}
    export _archivefilename=$(grep id manifest.json | awk -F \" '{print $4}')
    #bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json
}

package() {
    #install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
    install -D -m644 cardbook-${pkgver}-tb.xpi ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}
