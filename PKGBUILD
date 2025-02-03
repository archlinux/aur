# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.9.8
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
  dd80c205fe16b21baf62dcff0521502f691edab066dfae892a8d5b8b2c70ddf64f56caf4c64f446074b60f34ed410bc34a764708dc67ba46edacedc13efbb8a3
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
