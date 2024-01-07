# Maintainer: ayham-1 <me@ayham.xyz>
pkgname='donglify'
pkgver='20240107b'
pkgrel=1
arch=('any')
pkgdesc='The ultimate Archlinux encryption USB dongiled setup.'
url='https://github.com/ayham-1/donglify'
license=('MIT')
depends=('python-termcolor' 'python-prompt_toolkit')
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://github.com/ayham-1/$pkgname/archive/refs/tags/$pkgver.tar.gz")
validpgpkeys=('8C38DD3A3030F8AEB8A9A2BC783F6DE277DA7BFF')
sha256sums=('904e5bee08c5de59c29c9537fe8b77c83b95aa450a588c28d0bdc3eaf61ec2c9')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
