# Maintainer: Cem Keylan <cem at ckyln dot com>

pkgname=st-ckyln
_pkgname=st
pkgrel=2
pkgver=1.2.4
pkgdesc="Simple Terminal from suckless.org (Fork)"
url="https://git.ckyln.com/st"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
depends=("libxft")
source=("https://git.ckyln.com/archives/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=("acb7a47b297f705defe611ea1a78cb0d")

provides=("st")
conflicts=("st")

build() {
	cd $srcdir/${_pkgname}-${pkgver}
	make
}

package() {
	cd $srcdir/${_pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
