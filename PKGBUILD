# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luca Popesco
pkgname=gl-gsync-demo
pkgver=1.0+3+g4fd963a
pkgrel=2
epoch=1
pkgdesc="Unofficial OpenGL G-SYNC Demo for Linux"
arch=('x86_64')
url="https://github.com/dahenry/gl-gsync-demo"
license=('MIT')
depends=(
  'freeglut'
  'glew'
  'libxnvctrl'
)
makedepends=('git')
_commit=4fd963a8ad880dc2d846394c8c80b2091a119591
source=("git+https://github.com/dahenry/gl-gsync-demo.git#commit=${_commit}")
sha256sums=('66f8792be5517d92d89991b0e820d412bb2683a9fffccc4bebc9fc20826b3463')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
