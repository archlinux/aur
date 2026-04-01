pkgname=showel-bin
pkgver=0.2.0.1
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/showel"
license=('unknown')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'xdotool'
)
provides=('showel')
conflicts=('showel' 'showel-git')
options=('!debug' '!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/showel/releases/download/v0.2.0.1/showel-linux-x86_64.tar.gz"
)
sha256sums=(
  'd879ede910c8c8958bfe62ce4d5bb06cd53c6bb340dc488bfabf3e74a5f92689'
)

package() {
  cd "${srcdir}"

  install -Dm755 "bin/showel" "${pkgdir}/usr/bin/showel"
  install -Dm644 "lib/showel/assets/app.css" "${pkgdir}/usr/lib/showel/assets/app.css"
  install -Dm644 "share/applications/showel.desktop" "${pkgdir}/usr/share/applications/showel.desktop"
  install -Dm644 "share/icons/hicolor/scalable/apps/showel.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/showel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/showel/README.md"
}
