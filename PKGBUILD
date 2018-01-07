# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=runtastic
pkgver=2.1.1
pkgrel=1
pkgdesc='Command line tool to archive all your Runtastic activities'
arch=('i686' 'x86_64')
url='https://github.com/Metalnem/runtastic'
license=('MIT')
depends=(glibc)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Metalnem/runtastic/archive/v${pkgver}.tar.gz")
sha256sums=('3acb230ddad16802da0f5688a231784e2f86bc4c81c20d974eef964feee8ebc4')
_gourl=github.com/Metalnem/runtastic

build(){
  cd "$srcdir"/$pkgname-$pkgver
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}
package(){
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 "$srcdir/bin/runtastic" "$pkgdir/usr/bin/runtastic"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

