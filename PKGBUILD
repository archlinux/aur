pkgname=noctune
pkgver=1.2.0
pkgrel=1
pkgdesc="A modern local music player. Built with Avalonia and .Net9."
arch=("x86_64")
url="https://github.com/raula09/LocalMusicPlayerApp"
license=("MIT")
depends=("vlc" "ffmpeg" "dotnet-runtime")
makedepends=("dotnet-sdk")
source=("https://github.com/raula09/LocalMusicPlayerApp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/LocalMusicPlayerApp-${pkgver}"
  dotnet publish -c Release -o publish
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/LocalMusicPlayerApp-${pkgver}/publish/LocalMusicPlayerApp" "${pkgdir}/usr/bin/noctune"

  install -Dm644 "${srcdir}/LocalMusicPlayerApp-${pkgver}/noctune.desktop" "${pkgdir}/usr/share/applications/noctune.desktop"
  install -Dm644 "${srcdir}/LocalMusicPlayerApp-${pkgver}/noctune.png" "${pkgdir}/usr/share/pixmaps/noctune.png"
}
