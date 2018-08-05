# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz")
sha256sums=('f54661ca6fe5c9f6812133f5c7c4f32a73359709a8a7f2046196ea02b839beb9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
