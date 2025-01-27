# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Maintainer: dllud <dllud riseup net>
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.12.12a0
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
license=('GPL-3.0-or-later')
arch=('any')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")
b2sums=('a7982ef0909923c50c52154285c38fc26e05fa585b497df95b1a3a1d32056c02e4f40b2d00c420b08d9472c27788ae963f7589c55f600eced4dac10eb2fad4d5')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
