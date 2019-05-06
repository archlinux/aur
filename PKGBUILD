# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-django-etesync-journal')
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=2
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
sha256sums=('716df1fc8670c79750e8a1e736b69ddbdbd238237565874ea9648387cc50626e')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
