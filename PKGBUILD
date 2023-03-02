# Maintainer: Craig Barnes <craigbarnes@protonmail.com>
pkgname='dte'
pkgver='1.11.1'
pkgrel='1'
pkgdesc='A small, configurable console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc')
optdepends=(
    'ctags: for generating "tags" files for the tag command'
    'git: for the builtin git-grep and git-open aliases'
    'fzf: for the builtin git-open alias'
)
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('3d7d0d375fd31906ed436de20161dddc42d97f969a93d22b02aecfc3451e6c39')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

check() {
    cd "$pkgname-$pkgver"
    make check V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
