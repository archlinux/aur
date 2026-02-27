# Maintainer: dillacorn (AUR: dillacorn, Reddit: u/dillacorn)
pkgname=awtwall
pkgver=1.1
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
sha256sums=('7b26e452e6bafc85112dfc2957122036b5c507bd1da268d95586601f71d23f4c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 awtwall "${pkgdir}/usr/bin/awtwall"
  [[ -f README.md ]] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
