# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="A JavaScript to Webassembly toolchain"
arch=(x86_64)
url="https://github.com/bytecodealliance/javy"
license=(APACHE)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/v$pkgver/LICENSE.md"
		"$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz.sha256")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz")
sha256sums=('3b26cd02b9d9bf324bce59edd88c02cb93fa9a908528b805264db8cde53295e6'
            'e966973cb80c2742ff1c37628370d30e09d17639e959b7337a955a8b8939cec4')
sha256sums_x86_64=('94b8c2d029e5fcd5a2ff0b6bb7c8679dd2fef31602d25e3a3246f8432c4ee141')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
