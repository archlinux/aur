# Maintainer: Ghassan Alduraibi <doti@ghassan.dev>

pkgname=doti
pkgver=0.4.0
pkgrel=1
pkgdesc='Easily manage all your dotfiles across your devices'
arch=('any')
url='https://github.com/alduraibi/doti'
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
b2sums=('c33754b572b50aa65b2bf4fca314647d42da3bbdaaeeae3ba82f4d49179063bf5916eb23ccade750ad01a1338455456a319788ac08e760eb601f02a31a848f3b')

build() {
	cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
}
