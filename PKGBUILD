# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=atbswp
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimalist macro recorder (X11 and Wayland)"
url="https://github.com/RMPR/atbswp"
arch=('x86_64')
license=('GPL')
depends=('zlib')
source=("https://github.com/RMPR/atbswp/releases/latest/download/atbswpv0.3.0-linux"
    atbswp.desktop
    atbswp.png)
sha256sums=('0a4a2c06c3fbb51e901e582e3725514d7730049c91a04f09faa1b614a3653a88'
    '2a7b7e1f7e094e655e291f60d1278f66ed7b2531e5baced5dc69cbbf13b0000f'
    'e7d3ce586bd9dea7a910d903dece14bdee818cfc566cb123fcb1cf47b07a6e11')

package() {
    # Copy executable and make it runnable
    install -D -m755 \
        "${srcdir}/atbswpv0.3.0-linux" \
        "${pkgdir}/usr/bin/${pkgname}"
    

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/atbswp.desktop" \
        "${pkgdir}/usr/share/applications/atbswp.desktop"

    install -D -m644 \
        "${srcdir}/atbswp.png" \
        "${pkgdir}/usr/share/pixmaps/atbswp.png"
}

