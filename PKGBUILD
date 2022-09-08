# Maintainer: Ghassan Alduraibi <stowd@ghassan.dev>

pkgname=stowd
pkgver=0.2.1
pkgrel=1
pkgdesc='Easily manage all your dotfiles across your devices'
arch=('any')
url='https://github.com/ghassan0/stowd'
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
b2sums=('d46d310978e6d46fdd1bbb2b42968edf59356f3e4cef4165a68a67b1cef4de61e81d2d831479a02d86c259ecff6c379c0de7ea8faaa65fad117b2faa39adf075')

build() {
	cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
