# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-django-etesync-journal')
_name=${pkgname#python-}
pkgver=1.2.0
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
sha256sums=('1b481f592217186482be9faee686f0c132790db4177deb1f5152b73e99ac6338')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
