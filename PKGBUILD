# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-lineedit
_pkgname=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="a readline library based on prompt_toolkit which supports multiple modes"
url="https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz"
arch=('i686' 'x86_64')
license=('MIT')
depends=('readline' 'python-pygments' 'python-wcwidth' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/lineedit/archive/v$pkgver.tar.gz")
sha256sums=('ad0e641387bd62f6b89938d61412b696a5b39b2b474749ae0da3f523885f93a0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
