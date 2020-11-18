
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-go-git
_pkgname=${pkgname%-git}
pkgver=r3.34e2e3c
pkgrel=2
pkgdesc='A Go plugin for Vis editor.'
arch=('any')
url='https://gitlab.com/timoha/vis-go'
license=('MIT')
depends=('vis' 'go' 'go-tools' 'godef')
provides=('vis-go')
conflicts=('vis-go')
source=("git+https://gitlab.com/timoha/vis-go.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"
    licenses="$pkgdir/usr/share/licenses/$_pkgname"

    cd "$srcdir/$_pkgname"
    install -Dm644 vis-go.lua "$vispath/vis-go.lua"
    install -Dm644 LICENSE "$licenses/LICENSE"
}
