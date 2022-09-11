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
b2sums=('e023b000d77048e4b50752e3ff91dddfb000cb687d368474b9efec7e1154a9b6da931069fea11314539c148d7f55ff4e54076859ac39cc6b48f0da688025e270')

build() {
	cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
