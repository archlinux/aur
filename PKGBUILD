# Maintainer: ApplicationMaker <Application-Maker.Uinwad@erine.email>
# Disable certain shellcheck checks for this script
# SC2034: Disable warnings about unused variables
# SC2154: Disable warnings about unset variables
# shellcheck disable=SC2034 disable=SC2154
pkgname=pacman-mirrors-helper-git
pkgver=r94.f5340a4
pkgrel=1
pkgdesc="A wrapper simplifying repository management and mirror selection using the rate-mirrors tool."
arch=(any)
url="https://codeberg.org/Application-Maker/pacman-mirrors-helper"
license=(GPL-3.0-or-later)
depends=(bash curl grep sed rate-mirrors ncurses)
makedepends=(git)
source=("git+https://codeberg.org/Application-Maker/pacman-mirrors-helper.git")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    printf "%s" "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    install -Dm755 pacman-mirrors-helper.sh "$pkgdir/usr/bin/pacman-mirrors-helper"
}
