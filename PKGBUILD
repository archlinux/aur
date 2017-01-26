# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig-git')
pkgname=('stig-git')
pkgver=0.1.0a.r2.9da7ec5
pkgrel=1
pkgdesc="TUI and CLI client for the Transmission daemon"
url="https://github.com/rndusr/stig"
depends=('python' 'python-urwid' 'python-urwidtrees-git' 'python-aiohttp'
         'python-appdirs' 'python-blinker')
makedepends=('git' 'python-setuptools')
license=('GPL')
arch=('any')
provides=('stig')
conflicts=('stig')
source=("git+https://github.com/rndusr/stig.git#branch=dev")
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
