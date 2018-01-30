pkgname=python-clay-player-git
pkgver=0.r73.cccc975
pkgrel=1
pkgdesc="Command Line Player for Google Play Music"
url="https://github.com/and3rson/clay"
depends=('python' 'python-gmusicapi' 'python-pyaml' 'python-urwid')
makedepends=('python-setuptools' 'git')
license=('GPLv3')
arch=('any')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
