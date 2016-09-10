# Maintainer: Samadi van Koten

pkgname=chicken-git
pkgver=0.r3356.116f42e
pkgrel=1
pkgdesc='Feature rich R5RS Scheme compiler and interpreter'
arch=('any')
url='http://call-cc.org/'
license=('BSD 3-Clause')
depends=()
makedepends=('git' 'make' 'chicken')
conflicts=('chicken')
provides=('chicken')
options=()
source=('git://code.call-cc.org/chicken-core.git')
md5sums=('SKIP')

pkgver() {
  cd chicken-core

  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/chicken-core"

  make PLATFORM=linux
}

check() {
  cd "$srcdir/chicken-core"

  make PLATFORM=linux check
}

package() {
  cd "$srcdir/chicken-core"

  make PLATFORM=linux DESTDIR="$pkgdir/" PREFIX='/usr' install
}
