
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-cscope-git
_pkgname=${pkgname%-git}
pkgver=r6.b29e2f9
pkgrel=2
pkgdesc='cscope interface for the vis editor.'
arch=('any')
url='https://git.sr.ht/~emg/vis-cscope'
license=('MIT')
depends=('vis' 'cscope')
provides=('vis-cscope')
conflicts=('vis-cscope')
source=("git+https://git.sr.ht/~emg/vis-cscope")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/plugins"
    licenses="$pkgdir/usr/share/licenses/$_pkgname"

    cd "$srcdir/$_pkgname"
    install -Dm644 cscope.lua "$vispath/cscope.lua"
    install -Dm644 LICENSE "$licenses/LICENSE"
}
