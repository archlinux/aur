# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.2.1
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('37509bb0ff9af7dc6024580c18990b9ea51caa007a0a751af276b92473d17ec1b10dd26f38b3ad9a2ca4e4edad224057002b54ae36454a0992557734deff511c')
b2sums_aarch64=('515e7f431640fe461557fe19aca6eb4442fe71cbfb7440b4cf90a7787f4ba5ba9d54360609b3e311be9a59ba1aabe8c4d79cbdbd87cf68405a359a9ec6e77ed1')
b2sums_armv7=('3d856d765f6066cd5a5773d81c3dc1e152056740825d07e5a93666d13e70cec450ceb37694179003f0b090dfb7737b345175c2e66168b24615a0cb1437defd4d')
package() {
	# binary
	install -Dm755 ./topgrade "$pkgdir/usr/local/bin/topgrade"
	# manpage
	mkdir -p "$pkgdir/usr/local/man/man8"
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' > "$pkgdir/usr/local/man/man8/topgrade.8"
}
