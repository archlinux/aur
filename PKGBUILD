# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.6
pkgrel=2
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz)
sha256sums=('ba213cc21822f24c3da4df11833ec93750fe35ad63479e7e5a01d1632c20e18f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
