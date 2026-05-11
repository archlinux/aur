pkgname='linuxtoys-bin'
pkgver='6.0.3'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject python-requests gtk3 vte3)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('e3e3a371e5360b8b102f0935a70f1d36d03be2d1a09919804cbc9e4d3d6f2fde')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/linuxtoys.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
    find "${pkgdir}/usr/share/linuxtoys/helpers/" -name "*.sh" -exec chmod +x {} \;
}
