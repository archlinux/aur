# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

pkgname="python-apt"
pkgver=2.9.9
pkgrel=2
pkgdesc="Python interface to libapt-pkg"
arch=('x86_64')
_url="https://salsa.debian.org/apt-team/${pkgname}/-/archive"
url="https://tracker.debian.org/pkg/${pkgname}"
license=('GPL-2.0-or-later')
depends=('apt' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-distutils-extra')
conflicts=()
options=(!emptydirs)
source=(
  "${_url}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=(
  ff3c4f46b39f057ae5ef0902d67884f34d3c3deee899b2e19933cd84a2be6e7a326f1dd37aa0fe3531ff4e485cda96d19e6d15a05ecc2c65e486df712621c64c
  )

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
