# Maintainer: Ghassan Alduraibi <doti@ghassan.dev>

pkgname=doti
pkgver=0.3.0
pkgrel=1
pkgdesc='Easily manage all your dotfiles across your devices'
arch=('any')
url='https://github.com/ghassan0/doti'
license=('GPL3')
depends=(
	python
	stow
)
makedepends=(
	python-build
	python-installer
	python-wheel
  python-hatchling
)
_tag=v${pkgver}
source=("${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('55d1c82d29cabd5bb367a8d35703a930f7ab855c6f733127c67b8400d193c9cc08f5c4bbc786784939acf943ad6fe1dd9b0fc5a9006904e990208d8761dcf457')

build() {
	cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
