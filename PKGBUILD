# Maintainer: ApplicationMaker <TomRobinson1990@proton.me>
_pkgname=pacman-mirrors-helper
pkgname=pacman-mirrors-helper-git
pkgver=r85.b08414c
pkgrel=1
pkgdesc="Basically a rate-mirrors wrapper"
arch=('any')
url="https://github.com/Application-Maker/pacman-mirrors-helper"
license=('MIT') # Replace with the appropriate license
depends=('bash' 'wget' 'rate-mirrors') # Add any dependencies your script requires
makedepends=('git') # Add 'git' as a build dependency
source=("git+https://github.com/Application-Maker/pacman-mirrors-helper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 pacman-mirrors-helper.sh "$pkgdir/usr/bin/pacman-mirrors-helper"
}
