pkgname=d2launcher
pkgver=3.6.3
pkgrel=1
pkgdesc="Launcher for Diablo 2, Median XL and D2 Stats"
arch=('x86_64')
url="https://github.com/murkl/d2launcher"
license=('unknown')
depends=(wine zenity curl p7zip unrar jq wmctrl fuse2 zip xdelta3)
optdepends=('lutris-wine-meta: Install in case of graphic issues')
source=("d2launcher.desktop" "${pkgname}-${pkgver}.tar.gz::https://github.com/murkl/d2launcher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP' '8ccfe116c8ffb43fbe4a7f588abfde88f9e593a5770ae9b63a14c9972bca8a1c')

package() {
    mkdir -p "${pkgdir}/opt/d2launcher"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "$pkgdir/opt/d2launcher/"
    cp d2launcher.desktop "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/opt/d2launcher/d2launcher"
    ln -s /opt/d2launcher/d2launcher "${pkgdir}/usr/bin/"
}
