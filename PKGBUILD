pkgname=pkgpick-git
pkgver=r1.6e86887
pkgrel=1
pkgdesc="Interactive fzf-based package picker for pacman/yay/paru (AUR, official, installed), EN/RU UI"
arch=('any')
url="https://github.com/ItzDast/pkgpick"
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'pacman')
optdepends=(
    'yay: AUR search/install/update support'
    'paru: alternative AUR helper (used if yay is absent)'
)
makedepends=('git')
provides=('pkgpick')
conflicts=('pkgpick')
source=("$pkgname::git+https://github.com/ItzDast/pkgpick.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/$pkgname/pkgpick.sh" "$pkgdir/usr/bin/pkgpick"
}
