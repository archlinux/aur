# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-polyglot
pkgver=16.7.4
pkgrel=3
pkgdesc="A natural language pipeline that supports massive multilingual applications"
url="https://github.com/aboSamoor/polyglot"
arch=('any')
provides=('python-polyglot')
depends=('python')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f7d9cca9a212622548e9416fb89f1238b994b8860ef49e03b7c82c67f9b6269b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
