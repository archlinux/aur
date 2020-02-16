# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=cloak
pkgver=0.2.0
pkgrel=1
pkgdesc='A Command Line OTP (One Time Password) Authenticator application'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evansmurithi/cloak"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87d356875eb26c70e95ccbd8ac1ecfa99bf974c486b42bea92460d18f6ac9699')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
