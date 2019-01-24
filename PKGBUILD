# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=python-pyparser
_name=${pkgname#python-}
pkgver=1.0
pkgrel=3
pkgdesc="pyparser is a collection of classes to make it easier to parse text data in a pythonic way."
arch=('any')
url="https://pypi.org/project/pyparser/"
license=('GPL')
depends=('python' 'python-parse')
optdepends=()
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d1b76e2dabdd2952cadfd545229cc144afee6130bf171a031d5bf53f11b912f5')
noextract=()

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i 's/parse==1.6.5/parse>=1.6.5/' requirements.txt
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
