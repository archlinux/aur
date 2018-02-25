# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig')
pkgname=('stig')
pkgver=0.8.3a
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
         'python-xdg' 'python-blinker' 'python-natsort')
makedepends=('python-setuptools')
optdepends=('python-geoip: shows country codes in peer lists'
            'python-pprofile: profiling')
license=('GPL')
arch=('any')
source=("stig-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")
sha256sums=('3b0d8fabef2e642ae08d2c45af60cf104e7c6e1c5abea10903a6d0ff2975f05d')

build() {
    cd "stig-${pkgver}"
    python setup.py build
}

package() {
    cd "stig-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
