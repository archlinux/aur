# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.12.10a0
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
	 'python-pyxdg' 'python-blinker' 'python-natsort' 'python-async-timeout')
makedepends=('python-setuptools')
optdepends=('python-pprofile: profiling'
	    'python-setproctitle: prettifies the process name'
		'python-aiohttp-socks: proxy support')
checkdepends=('python-asynctest')
license=('GPL')
arch=('any')

source=("stig-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")

sha256sums=('69105ed6ae6a8bd4450d37516368318b1c069b78fe8734171694e729fee2dc56')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
