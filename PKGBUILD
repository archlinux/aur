# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: froggie <sullivanva@gmail.com>
# Contributor: ryooichi <ryooichi+aur@gmail.com>

pkgname=ssdeep
pkgver=2.14.1
pkgrel=1
pkgdesc="A program for computing context triggered piecewise hashes"
arch=('i686' 'x86_64')
url="https://ssdeep-project.github.io/ssdeep/"
license=('GPL')
depends=('gcc-libs')
options=('!libtool')
source=(https://github.com/ssdeep-project/ssdeep/archive/release-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-release-$pkgver
  ./bootstrap
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir"/$pkgname-release-$pkgver
  make DESTDIR="$pkgdir" install || return 1
}
sha256sums=('d96f667a8427ad96da197884574c7ca8c7518a37d9ac8593b6ea77e7945720a4')
