# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Maintainer: Truocolo              ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.7.2
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
source=(
  "${_url}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=(
  71ea9b9f2efbb68f336a14a48e1b2f8765083c27ef5345968e1c6812cab3983239e50a70aea9c48ebef135de0da0231f70022213dcec136da9be29ee81460772
  )

package_python-apt() {
  depends+=('python')
  cd \
    "$srcdir/$pkgname-$pkgver"
  python \
    setup.py \
      install \
      --root="$pkgdir/" \
      --optimize=1
}

# vim:set ts=2 sw=2 et:
