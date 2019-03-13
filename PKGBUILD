# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-drf-nested-routers')
_name=${pkgname#python-}
pkgver=0.91
pkgrel=1
pkgdesc="Nested resources for the Django Rest Framework"
arch=(any)
url="https://pypi.org/project/drf-nested-routers/"
license=('Apache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('46e5c3abc15c782cafafd7d75028e8f9121bbc6228e3599bbb48a3daa4585034')
makedepends=('python-setuptools')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
