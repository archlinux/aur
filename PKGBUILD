# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz)
sha256sums=('4cd3ffba0f6bad3ed422683d4d39fe2df17a5313bd994ae4e6c43e6ae029c221')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
