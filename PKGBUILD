# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >

pkgname=stig
pkgver=0.11.2a0
pkgrel=4
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
	 'python-pyxdg' 'python-blinker' 'python-natsort' 'python-mock')
makedepends=('python-setuptools')
optdepends=('python-pprofile: profiling'
	    'python-setproctitle: prettifies the process name')
license=('GPL')
arch=('any')

source=("stig-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")

sha256sums=('cf2f57486fa980407b9762750e669099857069e6e17dd97860b5beada735efeb')

prepare(){
	cd "stig-${pkgver}"
	rm .python-version
}

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
