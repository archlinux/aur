# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.5.2
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
sha512sums=('eb0f96943c32afebb2172d0bf992802fdc807be6a4461966a8bfeba84a800475f837cf4d35272216e933e41a3e25fdb173b8234fbb629a89d9c59113d047ae41')

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
