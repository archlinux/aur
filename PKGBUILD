# Maintainer: liara (liara at archlinux.info)

pkgname=python-shodan
pkgver=1.5.4
pkgrel=1
pkgdesc="The official Python library for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-simplejson' 'python-requests' 'python-click' 'python-colorama')
makedepends=('python')
source=(https://pypi.python.org/packages/35/c1/046f2f9d6f529f391eaadade324e9db4cee122e840dd0cce38faacb44cb3/shodan-${pkgver}.tar.gz)
md5sums=('76633e0fb156b94cb5ddbc93d65d2c3f')

build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
