# Maintainer: Reverier-Xu <reverier.xu@woooo.tech>
pkgname=bitwave-bin
_pkgname=bitwave
pkgver=v1.0.3
pkgrel=1
pkgdesc="A simple media player based on Qt and MPV."
arch=('x86_64')
url="https://github.com/Reverier-Xu/BitWave"
license=('MPL')
depends=('qt6-base' 'qt6-svg' 'qt6-translations' 'qt6-wayland' 'ffmpeg' 'mpv')
provides=("BitWave")
conflicts=("bitwave-git")
source=("https://github.com/Reverier-Xu/BitWave/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-gnu-x86_64.tar.gz")
sha256sums=('4439de7ff4ca0c5fda7baa75e878872f3d92be99b14f768676760f54de74007e')
prepare() {
  tar xvf ${_pkgname}-${pkgver}-linux-gnu-x86_64.tar.gz
}

package() {
  install -Dm755 usr/bin/BitWave "$pkgdir"/usr/bin/BitWave
  install -Dm644 usr/share/applications/tech.woooo.bitwave.desktop "$pkgdir"/usr/share/applications/tech.woooo.bitwave.desktop
  install -Dm644 usr/share/icons/hicolor/scalable/apps/tech.woooo.bitwave.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tech.woooo.bitwave.svg
}
