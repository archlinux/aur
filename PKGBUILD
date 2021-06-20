# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

_name=aiostream
pkgname=python-aiostream
pkgver=0.4.3
pkgrel=1
pkgdesc="Generator-based operators for asynchronous iteration"
arch=('any')
url=https://github.com/vxgmichel/aiostream
license=('GPLv3')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('83c94fdbc9ccdc59f18a5b7962ae737a4b7bc5547ff96d997425bbdb23b92cf6abf583da575b47051b557dd81453a5b3635f3ef27171d172f3255e459c630fb9')

build() {
  cd $_name-$pkgver
  python setup.py build
}

# check() {
#   cd $_name-$pkgver
#   # TODO
# }

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
