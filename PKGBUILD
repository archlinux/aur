# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.9.4
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
  c87d60888eec6655e28586a0ce3d2ca93deff5471f15087000bf529ea77f4b286a2ad8b250dc546c4cf032fc1f388664e308b8b6997a5e0010b8889321967435
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
