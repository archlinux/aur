# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=soapdenovo
pkgver=1.05
pkgrel=1
pkgdesc="A novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes."
arch=("i686" "x86_64")
url="http://soap.genomics.org.cn/soapdenovo.html"
license=("GPL3")
depends=()
source=("http://soap.genomics.org.cn/down/SOAPdenovo-V1.05.src.tgz")

build() {
	cd "${srcdir}/SOAPdenovo-V$pkgver"
	make
}

package() {
	cd "${srcdir}/SOAPdenovo-V$pkgver"
	mkdir -p ${pkgdir}/usr/bin
	install -t ${pkgdir}/usr/bin -m755 bin/*
	install -Dm644 MANUAL ${pkgdir}/usr/share/SOAPdenovo/MANUAL 
}

md5sums=("f6d16bce2b8233b6fd93c6009dcc40b3")


