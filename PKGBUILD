# Maintainer: Michał Wojdyła        micwoj9292 at gmail dot com
# Contributor: Pellegrino Prevete   pellegrinoprevete at gmail dot com
# Contributor: Truocolo             ttuocolo at aol dot com
# Contributor: Johannes Dewender    arch at JonnyJD dot net
# Contributor: Jacob Alexander      haata at kiibohd dot com

pkgname="python-apt"
pkgver=3.0.0
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
#  "${_url}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
https://deb.debian.org/debian/pool/main/p/python-apt/python-apt_3.0.0.tar.xz
)
sha512sums=(
  7c8a3ee8197a45f1611da1c49d693a723daf220a5c3eff02e3715479099447e9da7639fa4bfd03c4877a7f436f029c8aee6c58e1eb77e7ad850bc6409bc551e7
  )

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
