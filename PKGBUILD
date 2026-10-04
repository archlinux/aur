# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="jellyfin-autorefresh-new-releases-bin"
_pkgname="jellyfin-autorefresh"
pkgver=0.4.18
pkgrel=1
pkgdesc="Get missing metadata for new releases in Jellyfin"
arch=('x86_64' 'aarch64')
url="https://github.com/SinTan1729/$_pkgname-new-releases"
license=("GPL3")
provides=("jellyfin-autorefresh")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-amd64-linux.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-arm64-linux.tar.gz")
sha256sums_x86_64=('86f3c517bd244c8b6de84234eb3bc0ec0637cb43f3e9ae2edaf7f8f5c81bacc4')
sha256sums_aarch64=('395405e81329d62122c6aa28fc1ffb6443ef492e34dd286a356c1c41b8b8b448')
package() {
    [ -f ./$_pkgname-amd64 ] && mv ./$_pkgname-amd64 ./$_pkgname
    [ -f ./$_pkgname-arm64 ] && mv ./$_pkgname-arm64 ./$_pkgname
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
