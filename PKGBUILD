
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-base16-git
_pkgname=base16-vis
pkgver=r6.05dae61
pkgrel=1
pkgdesc='cscope interface for the vis editor.'
arch=('any')
url='https://github.com/pshevtsov/base16-vis'
license=('MIT')
depends=('vis')
provides=('vis-base16')
conflicts=('vis-base16')
source=("git+https://github.com/pshevtsov/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    vispath="$pkgdir/usr/share/vis/themes"
    licenses="$pkgdir/usr/share/licenses/${pkgname%-git}"

    cd "$srcdir/$_pkgname"
    install -dv "$vispath"
    cp themes/* "$vispath"
    install -Dm644 LICENSE "$licenses/LICENSE"
}
