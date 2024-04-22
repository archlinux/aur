# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-tmdbapis'
_name=${pkgname#python-}
pkgver=1.2.13
pkgrel=1
pkgdesc="A set of tools based around the requests library for safely making HTTP requests on behalf of a third party."
arch=('any')
url="https://github.com/meisnate12/TMDbAPIs"
license=('MIT')
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('679680461c1647864d93ad77908d240651fee8aff053e51b4fe9ca8c123c19935f0bc459b5f286a0f8b77c21c07f8d0085b11b5f56b7a559b484383bc2461d58')

package() {
  cd tmdbapis-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
