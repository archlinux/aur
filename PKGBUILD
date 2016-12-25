# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Florian Walch <florian+aur@fwalch.com>

pkgname=libtermkey
pkgver=0.19
pkgrel=1
pkgdesc='Library for easy processing of keyboard entry from terminal-based programs'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libtermkey'
license=('MIT')
depends=('unibilium')
source=("http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c505aa4cb48c8fa59c526265576b97a19e6ebe7b7da20f4ecaae898b727b48b7')

build() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr
}

package() {
	cd "${pkgname}-${pkgver}/"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

