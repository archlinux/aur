# Maintainer: fengkx <liangkx8237 [At] gmail.com>
pkgname=webarchiver-bin
_binname=webarchiver
pkgver=0.1.1
pkgrel=0
pkgdesc=""
arch=("x86_64")
url="https://github.com/fengkx/webarchiver/"
license=('MIT')
source=("$_binname-$pkgver.tar.gz::https://github.com/fengkx/$_binname/releases/download/v$pkgver/${_binname}-v$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha1sums=("8877651056e0aef3a4023234a13e9a3f7eebecc2")

prepare() {
	mv -f "webarchiver-v$pkgver-$arch-unknown-linux-gnu" "$_binname-$pkgver"
}

package() {
	cd "$_binname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_binname/LICENSE
	install -Dm +x "$_binname" ${pkgdir}/usr/bin/${_binname}

}
