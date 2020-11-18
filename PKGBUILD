
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-fzf-open-git
_pkgname=${pkgname%-git}
pkgver=r7.ef104ea
pkgrel=2
pkgdesc='Use fzf to open files in vis.'
arch=('any')
url='https://github.com/guillaumecherel/vis-fzf-open'
license=('AGPL3')
depends=('vis' 'fzf')
provides=('vis-fzf-open')
conflicts=('vis-fzf-open')
source=("git+https://github.com/guillaumecherel/vis-fzf-open.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"
    licenses="$pkgdir/usr/share/licenses/$_pkgname"

    cd "$srcdir/$_pkgname"
    install -Dm644 fzf-open.lua "$vispath/fzf-open.lua"
    install -Dm644 LICENCE "$licenses/LICENSE"
}
