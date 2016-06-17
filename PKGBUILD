# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='braa'
pkgver='0.82'
pkgrel=1
pkgdesc='A mass snmp scanner'
arch=('any')
url='http://s-tech.elsat.net.pl/braa/'
license=('GPL2')
source=('http://s-tech.elsat.net.pl/braa/braa-0.82.tar.gz')
md5sums=('e28f8b0591672de9aaa7dcf54332f6ce')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
        install -dm755 "${pkgdir}/usr/share/${pkgname}"
        cp -rf * "${pkgdir}/usr/share/${pkgname}/"
        ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
