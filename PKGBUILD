# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>

pkgname=coulr
pkgver=1.6.0
pkgrel=2
pkgdesc="Coulr is a color box to help developers and designers."
arch=("any")
url="https://github.com/Huluti/${pkgname}"
license=('MIT')
depends=('python' 'libnotify' 'python-gobject' 'gtk3')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("2491ae9f5c3a3d8be42d2afbe2b31cbc")

package() {
    cd "${srcdir}/Coulr-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -a img/* "${pkgdir}/usr/share/${pkgname}"
    cp -a po/* "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm755 src/main.py ${pkgdir}/usr/bin/${pkgname}
    # Translations
    install -dm755 ${pkgdir}/usr/share/${pkgname}/po/fr/LC_MESSAGES/
    msgfmt po/fr/LC_MESSAGES/$pkgname.po -o ${pkgdir}/usr/share/${pkgname}/po/fr/LC_MESSAGES/$pkgname.mo
}
