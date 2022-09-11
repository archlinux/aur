# Maintainer: Ghassan Alduraibi <doti@ghassan.dev>

pkgname=doti
pkgver=0.3.1
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
b2sums=('fd70b9b82c20eb080fe96108b302d7059eec349002969de4a0b2a9312e981d4bf8f2d0c45715bfdb5267e205b288a57400033f5da61bee33d49f0eae1920b901')

build() {
	cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
