# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-drf-nested-routers')
_name=${pkgname#python-}
pkgver=0.94.1
pkgrel=1
pkgdesc="Nested resources for the Django Rest Framework"
arch=(any)
url="https://pypi.org/project/drf-nested-routers/"
license=('Apache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2b846385ed95c9f17bf4242db3b264ac826b5af00dda6c737d3fe7cc7bf2c7db')
makedepends=('python-setuptools')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
