# Maintainer: ApplicationMaker <Application-Maker.Uinwad@erine.email>
pkgname=pacman-mirrors-helper-git
pkgver=r268.7f1db7e
pkgrel=1
pkgdesc="A lightweight CLI tool to manage repository mirrors and configuration."
arch=(any)
url="https://codeberg.org/Application-Maker/pacman-mirrors-helper"
license=(GPL-3.0-or-later)
depends=(bash coreutils curl gawk sed util-linux)
optdepends=('ncurses: Required for interactive menus to work.'
            'sudo: The script will use sudo if available')
makedepends=(coreutils git)
source=("git+https://codeberg.org/Application-Maker/pacman-mirrors-helper.git#branch=main")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    install -Dm755 pacman-mirrors-helper.sh "$pkgdir/usr/bin/pacman-mirrors-helper"
}
