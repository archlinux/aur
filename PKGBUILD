# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>

pkgname=speedtest-rs-bin
pkgver=0.1.4
pkgrel=2
pkgdesc="speedtest-cli in Rust."
arch=('x86_64')
url="https://github.com/nelsonjchen/speedtest-rs"
license=('Apache' 'MIT')
provides=("speedtest-rs")
conflicts=("speedtest-rs")
source=("speedtest-rs-${pkgver}-${pkgrel}.tar.gz::https://github.com/nelsonjchen/speedtest-rs/releases/download/v${pkgver}/speedtest-rs-linux-x86_64.tar.gz")
sha256sums=('6d4bffd7c5386c4fcc2f21d945ca87375855f810a26619de10d1f58e00dec699')

package() {
	install -Dm755 speedtest-rs -t $pkgdir/usr/bin/
	for l in LICENSE-*;
	do
	  install -Dm644 $l -t $pkgdir/usr/share/licenses/$pkgname
	done
}
