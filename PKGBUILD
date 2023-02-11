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
sha512sums=('b299e818ff542e179d00d41a42b1e40b4be73547c393a38e845b6b623cb20c5e0dbd8b5c3aeec3a82faf80ed9614f35a425afa44f53dbcfe7a58c3fb5e7da5e6')

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
