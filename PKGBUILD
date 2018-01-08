# Maintainer: Jake Howard <git+aur@theorangeone.net>
pkgname=tbg
pkgver=0.3.0
pkgrel=0
pkgdesc="Use feh to randomize desktop backgrounds from a directory "
makedepends=('rust' 'cargo')
license=('unknown')
depends=('feh')
url="https://github.com/RealOrangeOne/tbg"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgver.tar.gz::https://github.com/RealOrangeOne/tbg/archive/$pkgver.tar.gz")
sha512sums=('5f0278acd257560c26631065319e5b390bf9b73f7ea26466846c1f3c1d7be0cdc7638299c5175c647043f8e113f186ecf99c5591ebd3e15212e3356f0f7cd59c')

package() {
    cd $pkgname-$pkgver
    cargo build --release
    install -D -m755 "target/release/tbg" "$pkgdir/usr/bin/tbg"
}
