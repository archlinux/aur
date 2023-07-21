# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="A JavaScript to Webassembly toolchain"
arch=(x86_64)
url="https://github.com/bytecodealliance/javy"
license=(APACHE)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/main/LICENSE.md"
		"$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz.sha256")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz")
sha256sums=('3b26cd02b9d9bf324bce59edd88c02cb93fa9a908528b805264db8cde53295e6'
            '564d8fc982a492ed9a76482ca1654f82154c4c4ef05d690a217dda95e489bf6c')
sha256sums_x86_64=('9051b3b0faf79f7e15164818203e4e989834868ef78dd6bd30213b1c92389798')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
