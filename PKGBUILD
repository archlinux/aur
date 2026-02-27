# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=awtwall
pkgver=1.0
pkgrel=1
pkgdesc='Fast TUI wallpaper picker for Wayland with libsixel previews'
arch=('any')
url='https://github.com/dillacorn/awtwall'
license=('MIT')

depends=(
  bash
  imagemagick
  libsixel
  swww
  jq
)

optdepends=(
  'hyprpaper: optional wallpaper backend'
  'kitty: optional kitty image previews (slower than sixel)'
  'curl: optional release/version check'
  'wget: optional release/version check'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dillacorn/awtwall/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('56e6986e37cf7be12a34b8af947d1d4a3f2f95db7f2add7d85bc90771acc1665')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 awtwall "${pkgdir}/usr/bin/awtwall"
  [[ -f README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
