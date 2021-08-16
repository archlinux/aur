# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.12.2a0
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
	 'python-pyxdg' 'python-blinker' 'python-natsort')
makedepends=('python-setuptools')
optdepends=('python-pprofile: profiling'
	    'python-setproctitle: prettifies the process name')
license=('GPL')
arch=('any')

source=("stig-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")

sha256sums=('f3a7b39d39bc8dae8661db9f24bbf6e9dacccf5e04f35c6bed1290e5c5120ddc')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
