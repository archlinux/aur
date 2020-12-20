# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=memstrack-git
pkgver=0.1.12.r8.ga93d5ad
pkgrel=1
pkgdesc="A memory allocation trace, like a hot spot analyzer for memory allocation (from git)"
arch=('any')
url="https://github.com/ryncsn/memstrack"
license=('GPL3')
makedepends=('gcc' 'git' 'ncurses')
provides=('memstrack')
conflicts=('memstrack')
source=("git+https://github.com/ryncsn/memstrack.git")
sha256sums=('SKIP')

pkgver() {
    cd memstrack
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd memstrack
    make
}

package() {
    cd memstrack

    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
