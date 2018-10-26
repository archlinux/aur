# Maintainer: mcp <mcp@praeger.org>
pkgname=tmux-manager-git
pkgver=r36.283e8ba
pkgrel=1
pkgdesc='Allows easy handling of various types of tmux sessions, as well as complex setups.'
arch=('any')
url='https://github.com/Ganneff/tm'
license=('BSD')
depends=('tmux')
makedepends=('git')
provides=('tm')
conflicts=('tm')
source=('tmux-manager::git+git://github.com/Ganneff/tm#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 tm $pkgdir/usr/bin/tm
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
