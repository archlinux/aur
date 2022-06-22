# Maintainer: Newman Sanchez <lrtech8 at gmail dot com>
pkgname=lightnovel.sh-git
_pkgname=lightnovel.sh
pkgver=0.1
pkgrel=1
pkgdesc="A terminal-based lightnovel reader written in Bash."
arch=('any')
url="https://github.com/lr-tech/lightnovel.sh"
license=('MIT')
depends=('awk' 'coreutils' 'curl' 'grep' 'less' 'ncurses' 'sed' 'w3m')
makedepends=('git')
source=("git+https://github.com/lr-tech/lightnovel.sh.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 lightnovel.sh "$pkgdir/usr/bin/lightnovel.sh"
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
