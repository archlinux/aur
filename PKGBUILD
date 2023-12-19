pkgname=d2launcher
pkgver=3.6.4
pkgrel=2
pkgdesc="Launcher for Diablo 2, Median XL and D2 Stats"
arch=('x86_64')
url="https://github.com/murkl/d2launcher"
license=('unknown')
depends=(wine zenity curl p7zip unrar jq wmctrl fuse2 zip xdelta3)
optdepends=('lutris-wine-meta: Install in case of graphic issues')
source=("d2launcher.desktop" "${pkgname}-${pkgver}.tar.gz::https://github.com/murkl/d2launcher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP' '2aa225ee00d653bb13f4a84caf48d7cfc172f7555613c2f7c063fdaa784e2c5d')

package() {
    mkdir -p "${pkgdir}/opt/d2launcher"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "$pkgdir/opt/d2launcher/"
    cp d2launcher.desktop "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/opt/d2launcher/d2launcher"
    ln -s /opt/d2launcher/d2launcher "${pkgdir}/usr/bin/"
}
