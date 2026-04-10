pkgname=showel-bin
pkgver=0.2.2.4
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/Showel"
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/Showel/releases/download/v0.2.2.4/showel-linux-x86_64.tar.gz"
)
sha256sums=(
  'a8e4dfd992e5c2337c960d3620e21e8858c19949f5a088bf63aecb9e5411e1c9'
)

package() {
  cd "${srcdir}"

  install -Dm755 "bin/showel" "${pkgdir}/usr/bin/showel"
  install -Dm644 "lib/showel/assets/app.css" "${pkgdir}/usr/lib/showel/assets/app.css"
  install -Dm644 "share/applications/showel.desktop" "${pkgdir}/usr/share/applications/showel.desktop"
  install -Dm644 "share/icons/hicolor/scalable/apps/showel.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/showel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/showel/README.md"
}
