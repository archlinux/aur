# Maintainer: Klimenko Maxim <klimenkomaximsergievich@gmail.com>
# Contributor: Ryan Finnie <ryan@finnie.org>

_name=twuewand-git
pkgbase="${_name}"
pkgname=("${pkgbase}")
pkgver=0.0.2
pkgrel=1
pkgdesc="twuewand - A TrueRand algorithm for generating entropy"
arch=('any')
url="https://github.com/rfinnie/twuewand.git"
license=('MPL-2.0')
depends=('python-pycryptodome' 'python3')
makedepends=('git')
source=("${pkgname}::git+https://github.com/rfinnie/twuewand.git")
sha1sums=('SKIP')
conflicts=('twuewand-git')
provides=('twuewand-git')

makedepends=(git python-pycryptodome python-build python-installer python-wheel)

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

