# Maintainer: Bjorn Pagen <bjornpagenatgmaildotcom>

pkgname=systemf
pkgver=1.10
pkgrel=1
pkgdesc="a brainfuck interpreter supporting Linux syscalls"
arch=('x86_64')
url="https://github.com/ajyoon/systemf"
license=('unknown')
makedepends=('nasm')
source=("git://github.com/ajyoon/systemf")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	make build
}

package() {
	cd ${srcdir}/${pkgname}
	install -m755 -d ${pkgdir}/usr/bin/
	install -m755 -d ${pkgdir}/usr/share/doc/systemf
	install -m755 bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -m644 README.md ${pkgdir}/usr/share/doc/systemf/README.md
	cp -a examples/ ${pkgdir}/usr/share/doc/systemf/examples
}

