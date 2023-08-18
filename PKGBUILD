# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='cross-install'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='POSIX-complient cross-platform install command'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/cross-install'
license=('MPL2')
depends=('sh')
makedepends=('git' 'shellcheck' 'getoptions' 'moreutils')
source=("$pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/cross-install.git#tag=v$pkgver")
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
