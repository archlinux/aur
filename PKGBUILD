# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

pkgname="python-apt"
pkgver=3.0.0
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
  "${_url}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=(
  307bc9ae5606931adef18373e0e68ac1a7a8e5915ac102d445e1ef1e26a5c38895e6b90defd66c093734482cfbe808251ef9b0dadf7c391f3eccaa6b4919041c
  )

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
