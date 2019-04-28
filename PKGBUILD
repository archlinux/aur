# Maintainer: robertfoster

pkgname=libindy-crypto
pkgver=0.5.1
pkgrel=1
pkgdesc="Shared crypto library for Hyperledger Indy components"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libsodium')
makedepends=('rust')
source=("indy-crypto-$pkgver.tar.gz::https://static.crates.io/crates/indy-crypto/indy-crypto-0.5.1.crate'")

build() {
	cd $srcdir/indy-crypto-$pkgver
	cargo build --release
}

package() {
	cd $srcdir/indy-crypto-$pkgver
	install -Dm755 target/release/libindy_crypto.so "$pkgdir/usr/lib/libindy_crypto.so"
	install -d 755 $pkgdir/usr/include/indy_crypto/
	cp include/*.h $pkgdir/usr/include/indy_crypto
}

md5sums=('226d7a818179e012c5bf602bed0e67e6')
