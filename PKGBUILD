# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=doko-rs
_binname=doko
pkgver=0.1.0
pkgrel=0
pkgdesc="Docker-based development-only dependency manager"
arch=("x86_64")
url="https://github.com/fengkx/doko-rs/"
license=('Unlicense')
depends=("docker")
source=("$pkgname-$pkgver.tar.gz::https://github.com/fengkx/$pkgname/releases/download/v$pkgver/doko-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha512sums=("34437f4cb1426a678b5c7604292f22828c2f4376469d7d5f1290978be75f64a2233310fcba42e8a62ca88fa758757bc093a25469692e05d6a166ed8a1734fbb3")

prepare() {
	mv -f "doko-v$pkgver-$arch-unknown-linux-gnu" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm +x "$_binname" ${pkgdir}/usr/bin/${_binname}

}
