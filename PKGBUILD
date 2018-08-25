# Maintainer: Giacomo Longo <gabibbo97@gmail.com>
pkgname=python-dictdiffer
pkgver=0.7.1
pkgrel=1
pkgdesc="Dictdiffer is a library that helps you to diff and patch dictionaries"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
arch=('any')
makedepends=('python-setuptools')
depends=('python')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
md5sums=('e58fbec47e54ee4450bc768b08cb1ae4')
