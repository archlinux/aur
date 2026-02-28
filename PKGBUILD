# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=awtwall
pkgver=1.2
pkgrel=1
pkgdesc='Fast TUI wallpaper picker for Wayland with libsixel previews'
arch=('any')
url='https://github.com/dillacorn/awtwall'
license=('MIT')

depends=(
  bash
  imagemagick
)

optdepends=(
  'awww-bin: preferred wallpaper backend (successor to swww)'
  'awww-git: preferred wallpaper backend (git package of successor to swww)'
  'swww: fallback wallpaper backend'
  'hyprpaper: optional still-image wallpaper backend'
  'hyprland: provides hyprctl for hyprpaper backend and better monitor detection'
  'mpvpaper: optional video wallpaper backend'
  'chafa: recommended SIXEL preview encoder'
  'libsixel: img2sixel SIXEL preview encoder'
  'jq: better monitor detection'
  'ffmpeg: better .mp4 thumbnail extraction'
  'xdg-utils: open wallpaper folder from the UI'
  'kitty: optional kitty image previews (slower than sixel)'
  'curl: optional release/version check'
  'wget: optional release/version check'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dillacorn/awtwall/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('65e30dd346ea7e1a4bbe1d5a73a8c1217c963312c3b9320ad6f3580123ef2f09')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 awtwall "${pkgdir}/usr/bin/awtwall"
  [[ -f README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
