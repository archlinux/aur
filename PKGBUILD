# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Walch <florian+aur@fwalch.com>

pkgname=libtermkey
pkgver=0.18
pkgrel=1
pkgdesc='Library for easy processing of keyboard entry from terminal-based programs'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libtermkey'
license=('MIT')
depends=('unibilium')
source=("http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('239746de41c845af52bb3c14055558f743292dd6c24ac26c2d6567a5a6093926')

build() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr
}

package() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

