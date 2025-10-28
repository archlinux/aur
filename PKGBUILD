# Maintainer: Jakub Smolage <contact@smolaga.dev>
pkgname=lamebar
pkgver=1.0.0
pkgrel=2
pkgdesc="Hyper-minimalistic status bar for Wayland compositors"
arch=('x86_64')
url="https://github.com/jakubsmolaga/lamebar"
license=('MIT')
depends=()
makedepends=('make' 'gcc' 'libpng')
source=("https://github.com/jakubsmolaga/lamebar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5db7ca5a4813549ca90945df8c3550fb3dd31b4aee04865247e15a3fa6f39f1e')

build() {
  cd "${srcdir}/lamebar-${pkgver}"
  mkdir -p build
  make generate
  make release
}

package() {
  cd "${srcdir}/lamebar-${pkgver}"
  install -Dm755 build/lamebar "$pkgdir/usr/bin/lamebar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lamebar/LICENSE"
}
