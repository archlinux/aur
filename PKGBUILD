# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=3.0.1
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
            'c8d11e22f9b974cbacac31abc2776e0fb0eb008fa691d5b7bda462271fab7394')
sha256sums_x86_64=('3daf5cd1ecaa89c5ec2fe7121e45503f9ddaeab0b1936f4287f357ae2410e558')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
