# Maintainer: Anthony25 <Anthony Ruhier>

pkgname=python-pytest-flask
_name=pytest-flask
pkgver=1.2.0
pkgrel=1
pkgdesc="A set of pytest fixtures to test Flask applications."
arch=(any)
url='https://github.com/pytest-dev/pytest-flask'
license=(MIT)
makedepends=('python-setuptools')
depends=('python-pytest' 'python-flask' 'python-werkzeug')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('c0cbfdcf843573eba07cd009dc33b5f651dc859f94bd2059dccbf81ce6cc4c56870004b393254d9aa1beb5ff6225e3184ce26f71d74189eb6cb81b3ce0e3b219')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
