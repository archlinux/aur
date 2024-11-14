# Contributor: J0w03L <j0w03l at email dot com>

pkgname=shell-mommy-git
pkgver=r28.836eaf9
pkgrel=1
pkgdesc="Mommy is here for you on the command line ~ <3"
arch=("any")
url="https://github.com/sudofox/shell-mommy"
license=("unknown")
makedepends=("git")
source=("$pkgname::git+https://github.com/sudofox/shell-mommy.git")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm644 "shell-mommy.sh" -t "$pkgdir/usr/share/shell-mommy"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
