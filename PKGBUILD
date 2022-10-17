# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=twitch-python
_name=twitch-python
pkgver=0.0.20
pkgrel=2
pkgdesc="Object-oriented Twitch API for Python developers "
arch=('any')
url="https://github.com/PetterKraabol/Twitch-Python"
license=('MIT')
depends=('python'
         'python-requests' 'python-rx')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-responses')
optdepends=()
provides=('python-twitch-python')
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6e09d7210b8e0abb6892767d722079eb35b14c29e770cdb4df64d569ecbaa17c')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
