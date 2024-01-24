# Maintainer: ayham-1 <me@ayham.xyz>
pkgname='donglify'
pkgver='20240124'
pkgrel=1
arch=('any')
pkgdesc='The ultimate Archlinux encryption USB dongiled setup.'
url='https://github.com/ayham-1/donglify'
license=('MIT')
depends=('python-termcolor' 'python-prompt_toolkit')
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://github.com/ayham-1/$pkgname/archive/refs/tags/$pkgver.tar.gz")
validpgpkeys=('8C38DD3A3030F8AEB8A9A2BC783F6DE277DA7BFF')
sha256sums=('ef75ed019c86ee5a1702739c0ad0c410906410e5d9585d13d7ccb9913d6323f1')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
