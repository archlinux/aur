# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig')
pkgname=('stig')
pkgver=0.8.2a
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
sha256sums=('889ed30fb58ab5c5e71ee9f52fa83b7bcb68e410654b2cae5547fb4f40de8855')

build() {
    cd "stig-${pkgver}"
    python setup.py build
}

package() {
    cd "stig-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
