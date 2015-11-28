# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=join-python
pkgver=1.2
pkgrel=1
pkgdesc="Join-calculus for Python"
arch=(any)
url="https://github.com/maandree/join-python"
license=('GPL3')
install=join-python.install
depends=(python3)
makedepends=(texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=('aea1046c9a1c9040834613bc88215c757ec2a6fc9a88f0aae7fa6e05a4cffff7')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1,2)"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" PYVERSION="$(python -V | cut -d ' ' -f 2 | cut -d . -f 1,2)" install
}

