# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>

pkgname=coulr
pkgver=1.6.3
pkgrel=1
pkgdesc="Coulr is a color box to help developers and designers."
arch=("any")
url="https://github.com/Huluti/${pkgname}"
license=('MIT')
depends=('python' 'libnotify' 'python-gobject' 'gtk3')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("fb41081f33335fd7b54c2388db592923")

package() {
    cd "${srcdir}/Coulr-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp img/coulr.png "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm755 src/main.py ${pkgdir}/usr/bin/${pkgname}
    # Translations
    install -dm755 ${pkgdir}/usr/share/locale/fr/LC_MESSAGES
    msgfmt po/fr/LC_MESSAGES/$pkgname.po -o ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/$pkgname.mo
}
