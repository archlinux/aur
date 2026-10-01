# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="immich-custom-memories-bin"
_pkgname="immich-custom-memories"
pkgver=0.3.0
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64' 'aarch64')
url="https://github.com/SinTan1729/$_pkgname"
license=("GPL3")
provides=("immich-custom-memories")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-amd64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-arm64-linux.tar.gz")
sha256sums_x86_64=('4cf88ae7305c5de6fdbaf077543fb82ec7cc28cc3cec8c1a15b954ef2ccc4b89')
sha256sums_aarch64=('c834faa3d70e1bcc1ae4ba0b2830d4e855769a5d2dcceceaa3f479e3c4ad7b71')
package() {
    [ -f ./$_pkgname-amd64 ] && mv ./$_pkgname-amd64 ./$_pkgname
    [ -f ./$_pkgname-arm64 ] && mv ./$_pkgname-arm64 ./$_pkgname
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
