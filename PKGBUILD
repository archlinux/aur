# Maintainer: Rain Clark <rain AT melonbread DOT dev>

pkgname=eget-bin
pkgver=1.3.4
pkgrel=2
pkgdesc="Easily install prebuilt binaries from GitHub"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/eget"
license=('MIT')

source_i686=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_386.tar.gz)
source_x86_64=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_amd64.tar.gz)

sha256sums_i686=('6dad370ce3d1bb882ae64937e64f0739059117c467586ed1a016f1bb5fa5b198')
sha256sums_x86_64=('c6b3da99e494e14a9f8c2877f9eb5891d573a95f436ecba7013cfb7d0992abf5')

package() {
	mkdir -p ${pkgdir}/usr/bin
	install ${srcdir}/eget-*/eget ${pkgdir}/usr/bin/eget

	mkdir -p ${pkgdir}/usr/share/man/man1
	gzip ${srcdir}/eget-*/eget.1
	cp ${srcdir}/eget-*/eget.1.gz ${pkgdir}/usr/share/man/man1
}
