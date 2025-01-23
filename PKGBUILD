# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r232.1d9d4d6
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=(
    'gpu-screen-recorder'
    'gpu-screen-recorder-notification'
    'libglvnd'
    'libx11'
    'libxrandr'
    'libxrender'
    'libxcomposite'
    'libxfixes'
    'libxi'
    'libxcursor'
    'linux-api-headers'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('de675b9d10c57d1a498c0ea3167e1c34fd16176b817018624595d4ded8c10b2ad16827b5dbdc71f6166fb383bfa90afe18324e58f2349825395610d6268d83d2')
install="${pkgname}.install"

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
