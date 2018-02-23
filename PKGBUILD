# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig-git')
pkgname=('stig-git')
pkgver=0.8.2a.r91.c28fd6b
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees-git' 'python-aiohttp'
         'python-xdg' 'python-blinker' 'python-natsort')
makedepends=('git' 'python-setuptools')
optdepends=('python-geoip: shows country codes in peer lists'
            'python-pprofile: profiling')
license=('GPL')
arch=('any')
provides=('stig')
conflicts=('stig')
source=("git+https://github.com/rndusr/stig.git")
sha256sums=('SKIP')

pkgver() {
    cd stig
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd stig
    python setup.py build
}

package() {
    cd stig
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
