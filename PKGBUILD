# Maintainer: envolution
# Contributor: Franz Müller <ethylisocyanat@gmail.com>

pkgname=python-descartes
_pkgname=descartes
pkgver=1.1.0
pkgrel=2
pkgdesc='Python lib for using geometric objects as matplotlib paths and patches.'
arch=('any')
url='https://pypi.org/project/descartes/'
license=('custom')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('135a502146af5ed6ff359975e2ebc5fa4b71b5432c355c2cafdc6dea1337035b')
makedepends=('python-setuptools')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
