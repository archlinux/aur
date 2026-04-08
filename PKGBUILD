# Maintainer: Daniil Nikolaev <your@email>

pkgname=cop
pkgver=0.1.2
pkgrel=1
pkgdesc="Utility that prints file content and copies it to clipboard"
arch=('x86_64')
url="https://github.com/DaniilNikolaev-uv/cop"
license=('MIT')
makedepends=('cargo')

optdepends=(
  'xclip: clipboard support on X11'
  'wl-clipboard: clipboard support on Wayland'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/DaniilNikolaev-uv/cop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ff7d5cfeac434913a9619fc916fe9d90737aa51c331329b296583c40642387b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/cop "$pkgdir/usr/bin/cop"
}
