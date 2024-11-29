# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.9.1
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
  f7bac063e8e2d1d3d52f314ea1493efa88996e7f27e3e917f2ab1478bcecc3f9973195658328419b1e8c31fcd9fa4659763578178b64d0693575f92591387917
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
