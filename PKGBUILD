# Maintainer: Bjorn Pagen <bjornpagenatgmaildotcom>

_srcname=systemf
pkgname=${_srcname}
pkgver=1.11
pkgrel=1
pkgdesc="A brainfuck interpreter supporting Linux syscalls"
arch=('x86_64')
url="https://github.com/ajyoon/systemf"
license=('unknown')
makedepends=('nasm')
source=("git://github.com/ajyoon/systemf")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${_srcname}
	make build
}

package() {
	cd ${srcdir}/${_srcname}
	install -m755 -d ${pkgdir}/usr/bin/
	install -m755 -d ${pkgdir}/usr/share/doc/${_srcname}
	install -m755 bin/${_srcname} ${pkgdir}/usr/bin/${_srcname}
	install -m644 README.md ${pkgdir}/usr/share/doc/${_srcname}/README.md
	cp -a examples/ ${pkgdir}/usr/share/doc/${_srcname}/examples
}

