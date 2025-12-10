# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Maintainer: dllud <dllud riseup net>
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.14.1a0
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
         'python-pyxdg' 'python-blinker' 'python-natsort' 'python-async-timeout')
makedepends=('python-setuptools')
optdepends=('python-pprofile: profiling'
            'python-setproctitle: prettifies the process name'
            'python-aiohttp-socks: proxy support')
license=('GPL-3.0-or-later')
arch=('any')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")
b2sums=('20e240f8d0c042e3ee7a75a18235d4282e7e38c5d66ca766b7c9264051105094ba29cecf77618a5cde645a88340252e68c5fc76e64c1a436480051290fda61bf')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
