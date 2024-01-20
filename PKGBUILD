# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luca Popesco
pkgname=gl-gsync-demo
pkgver=1.0+3+g4fd963a
pkgrel=1
epoch=1
pkgdesc="Unofficial OpenGL G-SYNC Demo for Linux"
arch=('x86_64')
url="https://github.com/dahenry/gl-gsync-demo"
license=('MIT')
depends=('freeglut' 'glew' 'libxnvctrl')
makedepends=('git')
_commit=4fd963a8ad880dc2d846394c8c80b2091a119591
source=("git+https://github.com/dahenry/gl-gsync-demo.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
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
