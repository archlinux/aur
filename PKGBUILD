# Maintainer: Busindre <busilezas at busindre dot com>

pkgname=gzrt
pkgver=0.8
pkgrel=1
pkgdesc='The gzip Recovery Toolkit (gzrt) has a program - gzrecover - that attempts to skip over bad data in a gzip archive.'
arch=('any')
url='https://www.aaronrenn.com/arenn/hacking/gzrt/gzrt.html'
license=('GPL')
depends=('glibc')
source=("https://www.aaronrenn.com/arenn/hacking/gzrt/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a1ca41320ec39a8d439e5c32fa950fa52c09caf7e9719ca63ff3aec23bbaafa88f78f9b7fc325bb2ba19a1555f12b89fbef91f7708fdbb3ec852d78bf531fc85')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	install -d "${pkgdir}/usr/bin" 
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -m755  gzrecover ${pkgdir}/usr/bin/
}
