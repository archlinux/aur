# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Maintainer: dllud <dllud riseup net>
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig
pkgver=0.13.0a0
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
b2sums=('1f6d92e1596481aa0dcbb711079d5bee517049525e7c7c5f0cd3d4fbf809ad67997a6a9261cb85c8c3c973420d028cd901db03fddabf2bd2a03b8c57964359c2')

build() {
	cd "stig-${pkgver}"
	python setup.py build
}

package() {
	cd "stig-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
