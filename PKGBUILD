# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=rtichoke
pkgver=0.2.1
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/rtichoke"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit' 'python-rapi')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/rtichoke/archive/v$pkgver.tar.gz")
sha256sums=('d642c4cd6bd486d499048c5f327221e1beb30d41394057069ae46bc58cd50a57')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
