# Maintainer: Craig Barnes <craigbarnes@protonmail.com>
pkgname='dte'
pkgver='1.11'
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
sha256sums=('3332117c07ae5052cf7b81124019788fe3c8bf5ffe1342a6da69b789edbec93d')

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
