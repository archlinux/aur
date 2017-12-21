# Maintainer: Jake Howard <git+aur@theorangeone.net>
pkgname=tbg
pkgver=0.1.0
pkgrel=2
pkgdesc="Use feh to randomize desktop backgrounds from a directory "
makedepends=('rust' 'cargo')
license=('unknown')
depends=('feh')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgver.tar.gz::https://github.com/RealOrangeOne/tbg/archive/$pkgver.tar.gz")
sha512sums=('8fd01f48ea112aaf8c043a06bfbf10487879ab69cff0edad8ac39610cb91c3777d7a8cd344582f70ba89ba3ca88a9bdad0054b47bb0bc110677a1ecc31f456db')

package() {
    cd $pkgname-$pkgver
    cargo build --release
    install -D -m755 "target/release/tbg" "$pkgdir/usr/bin/tbg"
}
