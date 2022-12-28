# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.5.0
pkgrel=1
pkgdesc="Python binding of lib${_pkg}-pkg"
arch=('any')
_url="https://salsa.debian.org/apt-team/${pkgname}/-/archive"
url="https://tracker.debian.org/pkg/${pkgname}"
license=('GPL2')
depends=('apt>=2.1')
makedepends=('python-setuptools' 'python-distutils-extra')
conflicts=()
options=(!emptydirs)
source=("${_url}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0e26d36f0a970d9b057e795ad388808f1d55ead01b3a0705da2b7a4fed5d45cff93adaddbbdbdf8e59e5afcf8aea1610d4835d0fa69afce066a9f224a9be3526')

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
