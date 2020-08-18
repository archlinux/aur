# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: liupold <rohhnch@protonmail.ch>

pkgname=pidswallow
pkgrel=1
pkgver=2.0
pkgdesc="A script to swallow your terminal automatically"
arch=(x86_64)
url="https://github.com/Liupold/pidswallow"
license=('APACHE')
depends=(xdo xorg-xprop xorg-xev xorg-xwininfo sh)
makedepends=(git)
provides=(pidswallow)

source=("$pkgname-$pkgver::https://github.com/Liupold/pidswallow/archive/2.0.tar.gz")
sha256sums=("9f78d8b97772b3d137cf0c13a414191bc1d5c6c834581c3ae59115191067c15f")


check() {
        cd "$pkgname-$pkgver" || return 1
}

package() {
        cd "$pkgname-$pkgver" || return 1
        install -Dm755 "./pidswallow" "$pkgdir/usr/bin/pidswallow"
        install -Dm644 "./man/pidswallow.1" "$pkgdir/usr/local/man/man1/pidswallow.1"
        install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
