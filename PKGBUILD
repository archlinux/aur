# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=arkenfox-hook-git
_pkgname=arkenfox-hook
_reponame=arkenfox-hooks
pkgver=r2.2c3c397
pkgrel=1
pkgdesc='Post-install hook to update the arkenfox user.js'
url='https://github.com/aartoni/arkenfox-hooks'
license=('Unlicense')
arch=('any')
depends=('arkenfox-user.js' 'sudo')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('usr/share/libalpm/hooks/arkenfox.hook')
source=("git+https://github.com/aartoni/arkenfox-hooks")
b2sums=('SKIP')

package() {
    cd "$_reponame"
    install -Dm644 pacman.hook "$pkgdir/usr/share/libalpm/hooks/arkenfox.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
