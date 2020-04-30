# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=secret
pkgver=0.3
pkgrel=1
pkgdesc="Keep your little secrets, publicly."
arch=('x86_64')
url="https://github.com/angt/secret"
license=('BSD')
depends=()
makedepends=('git')
source=("git+https://github.com/angt/secret#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
