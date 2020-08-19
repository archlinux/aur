# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname=unimgc
pkgver=0.1
pkgrel=1
pkgdesc="tool to decompress HDDGuru HDD Raw Copy Tool's proprietary .imgc compression format"
url='https://github.com/Shizmob/unimgc'
license=('WTFPL')
arch=('x86_64')
source=("https://github.com/Shizmob/unimgc/archive/v${pkgver}.tar.gz")
sha512sums=('f70c5f39da60b67ece3a5dee807e66be88749af36f9dab5ea7ed45155d64eb3d5115d4b5b3df57941f44e702f67a754c14e0a419bb148660457bbef4e4244b8d')


prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make clean || return 1
	}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make all || return 1
	}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -Dm755 unimgc "${pkgdir}/usr/bin/unimgc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	}
