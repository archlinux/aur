pkgname='linuxtoys-bin'
pkgver='5.6.7'
pkgrel=1
arch=('x86_64')
depends=(bash git curl wget zenity python python-gobject python-requests gtk3 vte3)
makedepends=()
conflicts=(linuxtoys)
provides=("linuxtoys=$pkgver")
source=("https://github.com/psygreg/linuxtoys/releases/download/${pkgver}/linuxtoys-${pkgver}.tar.xz")
sha256sums=('bbd86dc623d04991ee5463ded0fc7b95513d7688a592576bdc796ebc38ecacbf')

package() {
    mkdir -p ${pkgdir}/usr
    cp -rf ${srcdir}/linuxtoys-${pkgver}/usr/* ${pkgdir}/usr/
    
    # Set proper permissions for executable files
    chmod +x "${pkgdir}/usr/bin/linuxtoys"
    chmod +x "${pkgdir}/usr/share/linuxtoys/run.py"
    find "${pkgdir}/usr/share/linuxtoys/scripts/" -name "*.sh" -exec chmod +x {} \;
    find "${pkgdir}/usr/share/linuxtoys/helpers/" -name "*.sh" -exec chmod +x {} \;
}
