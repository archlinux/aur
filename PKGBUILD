# Maintainer: ApplicationMaker <Application-Maker.Uinwad@erine.email>
pkgname=pacman-mirrors-helper-git
pkgver=r94.f5340a4
pkgrel=1
pkgdesc="A wrapper simplifying repository management and mirror selection using the rate-mirrors tool."
arch=(any)
url="https://codeberg.org/Application-Maker/pacman-mirrors-helper"
license=(GPL-3.0-or-later)
depends=(bash curl grep sed rate-mirrors ncurses)
makedepends=(git)
source=("git+https://codeberg.org/Application-Maker/pacman-mirrors-helper.git#branch=main")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    printf "%s" "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    install -Dm755 pacman-mirrors-helper.sh "$pkgdir/usr/bin/pacman-mirrors-helper"
}
