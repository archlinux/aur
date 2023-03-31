# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stella <jens300304@gmail.com>

pkgname=python-wtc
_pkg="${pkgname#python-}"
pkgver=1.2.1
pkgrel=2
pkgdesc="An extension of the lzma compression format designed to make osu!std replays smaller."
url="https://github.com/circleguard/wtc-lzma-compressor"
arch=('any')
license=('AGPL3')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/circleguard/wtc-lzma-compressor/archive/refs/tags/v${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('2c3ba44acf2967f3af01f690cbfcf6338f35596c590b17a0e41fc5f8188368d4')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
