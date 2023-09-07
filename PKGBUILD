# Maintainer: ApplicationMaker <TomRobinson1990@proton.me>
_pkgname=pacman-mirrors-helper
pkgname=pacman-mirrors-helper-git
pkgver=r94.f5340a4
pkgrel=1
pkgdesc="A wrapper simplifying repository management and mirror selection using the rate-mirrors tool."
arch=('any')
url="https://codeberg.org/Application-Maker/pacman-mirrors-helper"
license=('GPL-3.0-or-later')
depends=('bash' 'wget' 'curl' 'grep' 'sed' 'rate-mirrors')
makedepends=('git')
source=("git+https://codeberg.org/Application-Maker/pacman-mirrors-helper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 pacman-mirrors-helper.sh "$pkgdir/usr/bin/pacman-mirrors-helper"
}
