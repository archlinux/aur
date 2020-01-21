# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-django-etesync-journal')
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="The server side implementation of the EteSync protocol."
arch=(any)
url="https://pypi.org/project/django-etesync-journal/"
license=('AGPL3')
depends=('python-django'
         'python-django-rest-framework'
         'python-drf-nested-routers')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7705ed5b0c8afd79c82d5662bb6d985439f32208ce572f0c914da69c7aa6a66f')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
