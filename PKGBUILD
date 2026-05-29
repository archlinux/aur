# Maintainer: Cyridge cyridge@proton.me
pkgname=rsv-ng-systemctl
pkgver=r1.0
pkgrel=1
pkgdesc="systemctl compatibility shim for runit (via rsv-ng)"
arch=('any')
url="https://gitlab.com/runit-rsv/Rsv-systemctl"
license=('GPL2')
depends=('rsv-ng')
makedepends=('git')
provides=('systemctl')
conflicts=('rsv')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 systemctl "$pkgdir/usr/bin/systemctl"
}
