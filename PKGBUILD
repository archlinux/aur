# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.5.3
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
sha512sums=('94170f309feed8dd61825ab62743ef586993e5ddd20180fdfd2be584a2e21eafe9fff47b885213ea95d4df38cd573f5c4b3324ba057ef240a3bbfface98e598d')

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
