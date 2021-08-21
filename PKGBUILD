pkgname=journal-watch-git
pkgver=7.91f43f4
pkgrel=1
pkgdesc='Like journalctl -f but with username prefixed'
url='https://github.com/sandsmark/journal-watch'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('gcc' 'git')
depends=('systemd-libs')
source=("git+https://github.com/sandsmark/journal-watch.git")
md5sums=('SKIP')

pkgver() {
    cd journal-watch
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd journal-watch
    make
}

package() {
    cd journal-watch
    install -D -m4755 journal-watch -t "${pkgdir}/usr/bin"
}
