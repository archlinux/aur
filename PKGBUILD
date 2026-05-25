pkgname=cristalix-wl-fix
pkgver=1.0.1
pkgrel=2
pkgdesc="Wrapper script to run Cristalix on Wayland/NVIDIA"
arch=('any')
url="https://github.com/maseckt/cristalix-wl-fix"
license=('MIT')
depends=('java-runtime>=21' 'curl')
provides=("cristalix")
conflicts=("cristalix")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('101da7f6203d6f2d3ca4b575d4294cbb20c3689f5ac89263ad561ecab546e8ba')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 AppRun "${pkgdir}/usr/bin/cristalix"
  install -Dm644 cristalix.desktop "${pkgdir}/usr/share/applications/cristalix.desktop"
  install -Dm644 cristalix.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cristalix.png"
  sed -i "s|Exec=.*|Exec=/usr/bin/cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
  sed -i "s|Icon=.*|Icon=cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
}
