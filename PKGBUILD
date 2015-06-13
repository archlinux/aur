# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Mike Roberts <noodlesgc@gmail.com>
pkgname=libcli
pkgver=1.9.7
pkgrel=2
pkgdesc="A shared library for including a Cisco-like command-line interface into other software."
arch=('i686' 'x86_64')
url="https://github.com/dparrish/libcli"
license=('GPL')
source=("https://github.com/dparrish/libcli/archive/v${pkgver}.tar.gz")
md5sums=('f33e0fdb8ae8e14e66036424704b201b')

prepare() {
  sed -i 's/-Werror//' "$srcdir/$pkgname-$pkgver"/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
