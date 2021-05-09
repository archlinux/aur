# Maintainer: Craig Barnes <craigbarnes@protonmail.com>
pkgname='dte'
pkgver='1.10'
pkgrel='2'
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
makedepends=(bash-completion)
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('db62aab235764f735adc8378f796d6474596582b7dae357e0bddf31304189800')

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
    make install install-bash-completion V=1 prefix=/usr DESTDIR="$pkgdir"
}
