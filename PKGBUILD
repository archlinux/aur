# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='cross-install'
pkgver='1.2.0'
pkgrel='4'
pkgdesc='POSIX-complient cross-platform install command'
arch=('any')
url='https://gitlab.com/stefanwimmer128/cross-install'
license=('MPL2')
depends=('sh')
makedepends=('git' 'shellcheck' 'getoptions' 'moreutils')
source=("$pkgname::git+https://gitlab.com/stefanwimmer128/cross-install.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    make
}

check() {
    cd "$pkgname"

    make check
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
