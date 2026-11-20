# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="jellyfin-autorefresh-new-releases-bin"
_pkgname="jellyfin-autorefresh"
pkgver=0.6.0
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64' 'aarch64')
url="https://github.com/SinTan1729/$_pkgname-new-releases"
license=("GPL3")
provides=("jellyfin-autorefresh")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-amd64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-arm64-linux.tar.gz")
sha256sums_x86_64=('4159a2b3f794e45e13b1513c434cc59dfe166dfcdd668a24a79e282384c352b9')
sha256sums_aarch64=('8524c1c38ae314d024a533191c72911df14e6a1847fcce1d70333528c2a84c7e')
package() {
    [ -f ./$_pkgname-amd64 ] && mv ./$_pkgname-amd64 ./$_pkgname
    [ -f ./$_pkgname-arm64 ] && mv ./$_pkgname-arm64 ./$_pkgname
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
