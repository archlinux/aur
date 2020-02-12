# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz)
sha256sums=('ba1d4f5a3e5f857be82cd66fc077ce32a66fc25ef5f9e7d42c0fc1853ae640a8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
