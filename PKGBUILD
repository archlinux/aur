# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="immich-custom-memories-bin"
_pkgname="immich-custom-memories"
pkgver=0.3.1
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64' 'aarch64')
url="https://github.com/SinTan1729/$_pkgname"
license=("GPL3")
provides=("immich-custom-memories")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-amd64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-arm64-linux.tar.gz")
sha256sums_x86_64=('cef1db4857cefcb4d087899cb639bb4d249beb0e2ef02d9beae74257e22cbab7')
sha256sums_aarch64=('0dfb4ba52b2b64b54c315526470e4b141eef9a6a8cb90233e7d895a76b7fa799')
package() {
    [ -f ./$_pkgname-amd64 ] && mv ./$_pkgname-amd64 ./$_pkgname
    [ -f ./$_pkgname-arm64 ] && mv ./$_pkgname-arm64 ./$_pkgname
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
