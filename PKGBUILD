pkgname=d2launcher
pkgver=4.0.0
pkgrel=1
pkgdesc="Launcher for Diablo 2, Median XL and D2 Stats"
arch=('x86_64')
url="https://github.com/murkl/d2launcher"
license=('unknown')
depends=(wine zenity curl jq unzip zip wmctrl fuse2 xdelta3)
optdepends=('lutris-wine-meta: Install in case of graphics or audio issues')
source=("d2launcher.desktop" "${pkgname}-${pkgver}.tar.gz::https://github.com/murkl/d2launcher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP' 'b8c7ae4a1ad0c83ab17eecdbda4c91ad14a7f7f08bca0e16c1c543aca1297893')

package() {
    mkdir -p "${pkgdir}/opt/d2launcher"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "$pkgdir/opt/d2launcher/"
    cp d2launcher.desktop "${pkgdir}/usr/share/applications/"
    chmod +x "${pkgdir}/opt/d2launcher/d2launcher"
    ln -s /opt/d2launcher/d2launcher "${pkgdir}/usr/bin/"
}
