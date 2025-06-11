pkgname=python-r3pcomms-git
pkgver=2.0.1
pkgrel=1
pkgdesc="Local communication with a River 3 Plus over USB HID and/or CDC(ACM)"
arch=('any')
url='https://github.com/greyltc/r3pcomms'
license=('MIT')
depends=(
	python-pyserial
	python-pyusb
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

