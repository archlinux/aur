# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=bombadillo-bin
_pkg="${pkgname%-bin}"
pkgver=2.3.3
pkgrel=2
pkgdesc="A non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://bombadillo.colorfield.space"
license=('GPL3')
depends=('glibc')
changelog=CHANGELOG
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/binaries/$_pkg-${pkgver}_linux_64.zip")
source_i686=("$pkgname-$pkgver-i686.zip::$url/binaries/$_pkg-${pkgver}_linux_32.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::$url/binaries/$_pkg-${pkgver}_linux_arm.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/binaries/$_pkg-${pkgver}_linux_arm.zip")
sha256sums_x86_64=('8085294ef719d7cda2946ef3e26e7761470a8bc8a376e273df965d3d677cfc63')
sha256sums_i686=('898deff7136a0bfd1204edeb88ad4ea855a9f7c04335175f22b70ada0fbea5ee')
sha256sums_armv7h=('a366cb101a5f257d011116eafeefc987bbfbcc3cc7948140a5980d4345a8afa5')
sha256sums_aarch64=('a366cb101a5f257d011116eafeefc987bbfbcc3cc7948140a5980d4345a8afa5')

package() {
	install -D "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm644 README.txt -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "$_pkg.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "$_pkg-icon.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "$_pkg.1" -t "$pkgdir/usr/share/man/man1/"
}
