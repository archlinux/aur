pkgname=python-supermutes
pkgver=0.2.5
pkgrel=2
pkgdesc="A collection of super mutables"
url="https://github.com/alexcouper/supermutes"
license=('none')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/s/supermutes/supermutes-${pkgver}.tar.gz")
sha256sums=('c4a3f9699c48df241d08eab218796e3056af78fafcf41bc2b0ddfe23d64831e4')
arch=('any')
depends=('python')
makedepends=('python-setuptools')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
