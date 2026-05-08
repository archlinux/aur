pkgname='linuxtoys-bin'
pkgver='6.0'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject python-requests gtk3 vte3)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('08ce0bc63d4f303ddff4c561c3d1cf3f87ffdbdd55faacda660ab8941ad6f30b')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/linuxtoys.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
    find "${pkgdir}/usr/share/linuxtoys/helpers/" -name "*.sh" -exec chmod +x {} \;
}
