# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Walch <florian+aur@fwalch.com>

pkgname=libtermkey
pkgver=0.20
pkgrel=2
pkgdesc='Library for easy processing of keyboard entry from terminal-based programs'
arch=('x86_64')
url='http://www.leonerd.org.uk/code/libtermkey'
license=('MIT')
depends=('unibilium')
source=("http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6c0d87c94ab9915e76ecd313baec08dedf3bd56de83743d9aa923a081935d2f5')

build() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr
}

package() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

