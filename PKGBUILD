# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-tmdbapis'
_name=${pkgname#python-}
pkgver=1.2.30
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
sha512sums=('d765fcd5dff7247123e426f719bcc9e0581f1cdccc0e26996fbd26de3675ce8c48bb8974ccf31bf878cc369593b9674b06982e6a4ff8f28ee24905fc1e1deb3d')

package() {
  cd tmdbapis-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
