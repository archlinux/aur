# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=makeppf
pkgver=3.0
pkgrel=1
pkgdesc="PPF (Playstation Patch File) Version 3.0 creation tool"
url="http://rescene.wikidot.com/ppf-o-matic"
arch=('x86_64')
license=('custom')
source=("http://rescene.wdfiles.com/local--files/ppf-o-matic/pdx-ppf3.zip")

sha256sums=('5201d979e720d59750a1341fac9cb2a1f1d57dc4cf49218f6c17a1b560ee1213')

build() {
	cd "$srcdir"/ppfdev/makeppf_src
	gcc -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -o makeppf makeppf3_linux.c
}

package() {
	cd "$srcdir"/ppfdev/makeppf_src
	install -Dm0755 makeppf "$pkgdir"/usr/bin/makeppf
}
