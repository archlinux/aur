pkgname=d2launcher
pkgver=3.6.0
pkgrel=1
pkgdesc="Launcher for Diablo 2, Median XL and D2 Stats"
arch=('x86_64')
url="https://github.com/murkl/d2launcher"
license=('unknown')
depends=(wine zenity curl p7zip unrar jq wmctrl fuse2 zip xdelta3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/murkl/d2launcher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('170bdbe39fc4e4d32d9bc03ac6636674079ba3e972945b57e31f7bd57c7a79b9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/d2launcher"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r ./. "$pkgdir/opt/d2launcher"
    chmod +x "${pkgdir}/opt/d2launcher/d2launcher"
    ln -s "${pkgdir}/opt/d2launcher/d2launcher" "${pkgdir}/usr/bin/"
}
