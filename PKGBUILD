# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=thunderbird-enigmail-nightly
_pkgname=enigmail-nightly
pkgver=1.9a1
pkgrel=2
_tb_ver=41.0a1.20150518
pkgdesc='OpenPGP security extension for Thunderbird - Nightly build'
url='http://www.mozilla-enigmail.org/download/nightly.php'
arch=('i686' 'x86_64')
license=('MPL')
depends=("thunderbird-nightly>=${_tb_ver}" 'gnupg')
makedepends=('unzip')
provides=('enigmail-nightly')
options=(!strip)

source=("https://www.enigmail.net/download/nightly/${_pkgname}-all.xpi")
md5sums=('SKIP')

_extension_id='{847b3a00-7ab1-11d4-8f02-006008948af5}'

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/opt/thunderbird-nightly-${_tb_ver}/extensions"
    unzip "${_pkgname}-all.xpi" -d "${pkgdir}/opt/thunderbird-nightly-${_tb_ver}/extensions/${_extension_id}"
    rm -rf "${pkgdir}/opt/thunderbird-nightly-${_tb_ver}/extensions/${_extension_id}/platform/"{Darwin,WINNT}*
}
