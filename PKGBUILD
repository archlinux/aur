# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=secret
pkgver=0.4
pkgrel=1
pkgdesc="A simple and tiny tool that will help you keep your little secrets"
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
