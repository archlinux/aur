# Maintainer: Ahmed W. <oneofone@gmail.com>

pkgname=tastyworks-bin
pkgver='1.9.2'
pkgrel='1'
pkgdesc="trading platform client"
arch=('x86_64')
url='https://tastyworks.com/'
license=('Copyright')
options=('!strip')
depends=('jre>=8')
makedepends=('tar' 'xz')

source=(https://download.tastyworks.com/desktop-1.x.x/${pkgver}/tastyworks-${pkgver}-${pkgrel}_amd64.deb)
sha256sums=('a59d74919ce035c772bd2c0577b495827e20773d21eb0f164b4791cd954adac5')

build() {
	mkdir -p ./app
	cd ./app
	tar xf ../data.tar.xz
	mkdir -p usr/share/applications/
	mv opt/tastyworks/lib/tastyworks-tastyworks.desktop usr/share/applications/
}

package() {
	mv ./app/* "${pkgdir}"
}
