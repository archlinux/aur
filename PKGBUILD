pkgname=python-r3pcomms-git
pkgver=1.0.1.dev2+g4182f9b
pkgrel=1
pkgdesc="River 3 Plus comms from scratch via USB CDC (ACM)"
arch=('any')
url='https://github.com/greyltc/r3pcomms'
license=('MIT')
depends=(
	python-pyserial
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-hatchling
	python-hatch-vcs
	python-hatch
	)
source=(
	git+https://github.com/greyltc/r3pcomms.git
)
conflicts=(python-r3pcomms)
provides=(python-r3pcomms)
sha256sums=('SKIP')

pkgver() {
	cd r3pcomms
	hatch version
}

build() {
    cd r3pcomms
    python -m build --wheel --no-isolation
}

package() {
    cd r3pcomms
    python -m installer --destdir="$pkgdir" dist/*.whl
}

