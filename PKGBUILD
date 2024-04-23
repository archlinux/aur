# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-tmdbapis'
_name=${pkgname#python-}
pkgver=1.2.14
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
sha512sums=('6effb28de493d19987705f1cf2f620f699092a1985025bb756aa1e94c583e90c062ab2d843f59e7070eb0e41f98d973407a8095664b6ec04bf26109c85ff3fa1')

package() {
  cd tmdbapis-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
