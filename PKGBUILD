# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-django-etesync-journal')
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="The server side implementation of the EteSync protocol."
arch=(any)
url="https://pypi.org/project/django-etesync-journal/"
license=('AGPL3')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('107aa607b6491fc614ab98a0c75f7849caf89f6fe9ad4f5a7173c2565274d437')
makedepends=('python-setuptools')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
