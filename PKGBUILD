# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

pkgname="python-apt"
pkgver=3.1.0
pkgrel=1
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
  f76d625b422069889f932b9353f2a536d36fb14fd83a73dc2923a78f39936f47e347cf1ea456c64137079ea990a13655248fc780beac93629c1b1999721f492f
  )

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
