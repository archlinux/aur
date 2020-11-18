
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-open_rej-git
_pkgname=${pkgname%-git}
pkgver=r6.872ac61
pkgrel=2
pkgdesc='Open the .rej file if present for the currently opened file.'
arch=('any')
url='https://gitlab.com/mcepl/vis-open_rej'
license=('MIT')
depends=('vis')
provides=('vis-open_rej')
conflicts=('vis-open_rej')
source=("git+https://gitlab.com/mcepl/vis-open_rej.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"
    licenses="$pkgdir/usr/share/licenses/$_pkgname"

    cd "$srcdir/$_pkgname"
    install -Dm644 init.lua "$vispath/open_rej/init.lua"
    install -Dm644 LICENSE "$licenses/LICENSE"
}
