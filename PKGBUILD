# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.12.3a0
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

sha256sums=('49cf2b8d73fa7f61a500672d02cd18a7155d842907b09450a5f92a9b360c6575')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
