# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-django-etesync-journal')
_name=${pkgname#python-}
pkgver=1.2.3
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
sha256sums=('c28940dde242a390f0ba9c15fe461d591a780a315c6566f5ea24780a2ac259c8')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
