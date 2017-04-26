# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgname=python-urwidtrees-git
pkgver=1.0.2.r35.9142c59
pkgrel=1
pkgdesc="Tree widgets for urwid"
arch=("any")
url="https://github.com/pazz/urwidtrees"
license=("GPL")
depends=("python-urwid>=1.1.0" "python-mock")
makedepends=("git")
provides=('python-urwidtrees')
conflicts=('python-urwidtrees')
source=("git+https://github.com/pazz/urwidtrees.git")
sha256sums=('SKIP')

pkgver() {
    cd urwidtrees
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd urwidtrees
    python setup.py build
}

package() {
    cd urwidtrees
    python setup.py install --root="${pkgdir}" --skip-build
}
