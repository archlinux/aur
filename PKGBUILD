# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

_pkg="apt"
pkgname="python-${_pkg}"
pkgver=2.9.9
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
  ff3c4f46b39f057ae5ef0902d67884f34d3c3deee899b2e19933cd84a2be6e7a326f1dd37aa0fe3531ff4e485cda96d19e6d15a05ecc2c65e486df712621c64c
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
