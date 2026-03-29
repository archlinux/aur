# Maintainer: yusufprompt <yusufygz23@gmail.com>
pkgname=procomp
pkgver=0.2.0
pkgrel=1
pkgdesc='Small multi-target C subset compiler with Linux and Windows x86_64 backends'
arch=('x86_64')
url='https://github.com/yusufprompt/procomp'
license=('MIT')
options=(!debug)
depends=('gcc')
makedepends=('make')
checkdepends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0715386e0edfc2cb4b6c1058bc7450bcc652be39f5b9e63c11afdc9aca82894b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
