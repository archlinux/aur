# Maintainer: Jake Howard <git+aur@theorangeone.net>
pkgname=tbg
pkgver=0.2.0
pkgrel=0
pkgdesc="Use feh to randomize desktop backgrounds from a directory "
makedepends=('rust' 'cargo')
license=('unknown')
depends=('feh')
url="https://github.com/RealOrangeOne/tbg"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgver.tar.gz::https://github.com/RealOrangeOne/tbg/archive/$pkgver.tar.gz")
sha512sums=('5ba8a922a09647956a8652b90fcf973d8660ab2478c1173fcabee5e66520d51bfbbedbea2670a9ddd7fd02c523bd99a6b6e9a4ed12eb0e3e8ef7519a96b498af')

package() {
    cd $pkgname-$pkgver
    cargo build --release
    install -D -m755 "target/release/tbg" "$pkgdir/usr/bin/tbg"
}
