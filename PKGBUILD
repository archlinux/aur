# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-lua-hook-git
pkgver=r2.4d04015
pkgrel=1
pkgdesc="Pacman hook to merge rime lua plugin"
arch=('any')
url="https://github.com/ayalhw/rime-lua-hook"
license=('MIT')
depends=('bash' 'librime')
makedepends=('git')
provides=('rime-lua-hook')
conflicts=('rime-lua-hook')
source=(
    "rime-lua-hook::git+https://github.com/ayalhw/rime-lua-hook.git"
)
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/rime-lua-hook
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/rime-lua-hook

    install -Dm644 rime-lua.hook "$pkgdir/usr/share/libalpm/hooks/rime-lua.hook"
    install -Dm755 rime-lua "$pkgdir/usr/share/libalpm/scripts/rime-lua"

    #install -Dm644 README.md "$pkgdir/usr/share/doc/rime-lua-hook/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rime-lua-hook/LICENSE"
}

# vim: set ts=4 sw=4 et:
