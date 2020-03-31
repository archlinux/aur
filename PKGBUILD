# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz)
sha256sums=('f5a8cc9a389b0827b0a31641be2d328092c844b9115ac9ee0d7898c4a763c4db')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
