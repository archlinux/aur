# Maintainer: Timo Sarawinski <timo [at] it-kraut [dot] net>

pkgname=roundcubemail-plugins-kolab
pkgver=3.5.2
pkgrel=1
pkgdesc='Kolab Plugins for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('php-ldap' 'roundcubemail' 'php-kolabformat')
optdepends=('roundcubemail-skin-chameleon: Kolab skin for roundcube'
            'pykolab: configuration tool')
source=("calendar-${pkgver}::https://github.com/kolab-roundcube-plugins-mirror/calendar/archive/${pkgver}.tar.gz"
        "libcalendaring-${pkgver}::https://github.com/kolab-roundcube-plugins-mirror/libcalendaring/archive/${pkgver}.tar.gz"
        "libkolab-${pkgver}::https://github.com/kolab-roundcube-plugins-mirror/libkolab/archive/${pkgver}.tar.gz"
        "tasklist-${pkgver}::https://github.com/kolab-roundcube-plugins-mirror/tasklist/archive/${pkgver}.tar.gz")
sha256sums=('8efe30c7013849455a63d34a408caaa1beba13d3dbeb8bb22e3795fa52307492'
            '44a146b5bd4639244cbf85a6116140ecf2c22832895979d790d52ca819e106ce'
            '9ca77ae871fdeea689928472bc5f713665938f342739718abc89b0f36f9bf041'
            '4e3e0d6ea0967ae8f13bfdbcc3be5edd90920d3a77e65cdf438675f26067406d')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/calendar-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/calendar"
    cp -r "${srcdir}/libcalendaring-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/libcalendaring"
    cp -r "${srcdir}/libkolab-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/libkolab"
    cp -r "${srcdir}/tasklist-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/tasklist"
}

