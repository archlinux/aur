# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Maintainer: dllud <dllud riseup net>
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.14.0a0
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
b2sums=('e4a8e23654238e9920f76d634174194245db3b46dba0a6106a8229dc6e2b01334adb8541166f2bdecbe79c8015dd715f76d7688419639d4161f15ae2d3f69ab8')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
