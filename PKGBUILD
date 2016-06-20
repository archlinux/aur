# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname=rfc_reader
pkgname=rfc-reader-git
pkgver=0.7.5679eb9
pkgrel=1
pkgdesc=""
arch=('any')
url='https://github.com/monsieurh/rfc_reader'
license=('GPLv3')
groups=()
depends=('python')
makedepends=('git' 'python')
provides=()
conflicts=()
backup=()
options=()
source=("git+https://github.com/monsieurh/$_pkgname")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local _version='0.7'
    printf '%s.%s' "${_version}" "$(git describe --always)"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=4 sw=4 et:
