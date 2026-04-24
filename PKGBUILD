pkgname=shovel-bin
pkgver=0.2.2.5
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/Shovel"
license=('unknown')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'xdotool'
)
provides=('shovel')
conflicts=('shovel' 'shovel-git')
options=('!debug' '!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/Shovel/releases/download/v0.2.2.5/shovel-linux-x86_64.tar.gz"
)
sha256sums=(
  'e3017f7d7917ab1553d8bb069df494d8cb63c119481190571a9ed07ebf01bbf1'
)

package() {
  cd "${srcdir}"

  install -Dm755 "bin/shovel" "${pkgdir}/usr/bin/shovel"
  install -Dm644 "lib/shovel/assets/app.css" "${pkgdir}/usr/lib/shovel/assets/app.css"
  install -Dm644 "share/applications/shovel.desktop" "${pkgdir}/usr/share/applications/shovel.desktop"
  install -Dm644 "share/icons/hicolor/scalable/apps/shovel.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/shovel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/shovel/README.md"
}
