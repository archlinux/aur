# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=kristall
pkgver=0.4
pkgrel=2
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://kristall.random-projects.net"
license=('GPL-3.0-or-later')
depends=('openssl' 'qt5-base' 'qt5-multimedia' 'qt5-svg')
makedepends=('git' 'qt5-tools')
_commit=be009e47529ea4118079928d7e7f3d3b4123c472  # tags/V0.4^0
source=("git+https://github.com/MasterQ32/kristall.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}
