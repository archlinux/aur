pkgname=archtoys-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Archtoys (precompiled binary)"
arch=("x86_64")
url="https://github.com/Mujtaba1i/Archtoys"
license=("MIT")
provides=("archtoys")
conflicts=("archtoys")
source=(
  "archtoys-linux-x86_64-v${pkgver}.tar.gz::https://github.com/Mujtaba1i/Archtoys/releases/download/v${pkgver}/archtoys-linux-x86_64.tar.gz"
  "archtoys.desktop"
  "archtoys.png"
  "archtoys-16.png"
  "archtoys-22.png"
  "archtoys-24.png"
  "archtoys-32.png"
  "archtoys-48.png"
  "archtoys-64.png"
  "archtoys-128.png"
  "archtoys-256.png"
  "archtoys-512.png"
)
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/archtoys" "${pkgdir}/usr/bin/archtoys"
  if [[ -f "${srcdir}/archtoys.desktop" ]]; then
    install -Dm644 "${srcdir}/archtoys.desktop" "${pkgdir}/usr/share/applications/archtoys.desktop"
  fi
  for size in 16 22 24 32 48 64 128 256 512 1024; do
    if [[ -f "${srcdir}/archtoys-${size}.png" ]]; then
      install -Dm644 "${srcdir}/archtoys-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/archtoys.png"
    fi
  done
  if [[ -f "${srcdir}/archtoys.png" ]]; then
    install -Dm644 "${srcdir}/archtoys.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/archtoys.png"
  fi
}
