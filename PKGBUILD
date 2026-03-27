# Maintainer: maseckt <138674313+maseckt@users.noreply.github.com>
pkgname=cristalix-wl-fix
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper script to run Cristalix on Wayland/NVIDIA"
arch=('any')
url="https://github.com/maseckt/cristalix-wl-fix"
license=('MIT')
depends=('java-runtime>=21' 'curl')
provides=("cristalix")
conflicts=("cristalix")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('edce1e86f8f448bcc4a1fc21df4b3e98d6b315f7f0cdf9987ecaebe264dd30e6')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 AppRun "${pkgdir}/usr/bin/cristalix"
  install -Dm644 cristalix.desktop "${pkgdir}/usr/share/applications/cristalix.desktop"
  install -Dm644 cristalix.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cristalix.png"

  sed -i "s|Exec=.*|Exec=/usr/bin/cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
  sed -i "s|Icon=.*|Icon=cristalix|" "${pkgdir}/usr/share/applications/cristalix.desktop"
}
