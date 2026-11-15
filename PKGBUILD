# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="immich-custom-memories-bin"
_pkgname="immich-custom-memories"
pkgver=0.4.0
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64' 'aarch64')
url="https://github.com/SinTan1729/$_pkgname"
license=("GPL3")
provides=("immich-custom-memories")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-amd64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-arm64-linux.tar.gz")
sha256sums_x86_64=('957d6f0b723b0225fb1fbc5c9ac8c062c16e30ab98297f1afeb700d6d143d9fb')
sha256sums_aarch64=('efa5a4a25e14d3235c45696d2144938e5162c5ed05f61fb8f575681cb1199186')
package() {
    [ -f ./$_pkgname-amd64 ] && mv ./$_pkgname-amd64 ./$_pkgname
    [ -f ./$_pkgname-arm64 ] && mv ./$_pkgname-arm64 ./$_pkgname
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
