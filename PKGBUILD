# Maintainer: fengkx <liangkx8237 [At] gmail.com>
pkgname=doko-rs
_binname=doko
pkgver=0.1.1
pkgrel=0
pkgdesc="Docker-based development-only dependency manager"
arch=("x86_64")
url="https://github.com/fengkx/doko-rs/"
license=('Unlicense')
depends=("docker")
install="doko.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/fengkx/$pkgname/releases/download/v$pkgver/doko-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha512sums=("34af028161e64e6e0777b537cefc8b3a7b0d275820c5d798d426fbb4b47612eebb4ed4c3bcc9193fb869060880027ab062c2e912542c9d397b9324e8ba8ddeab")

prepare() {
	mv -f "doko-v$pkgver-$arch-unknown-linux-gnu" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm +x "$_binname" ${pkgdir}/usr/bin/${_binname}

}