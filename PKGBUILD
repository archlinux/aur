# Contributor: Victor Tran <vicr12345 at gmail dot com>
pkgname=quad-bot
pkgver=1.1
pkgrel=1
pkgdesc="Discord Bot"
arch=("any")
url="https://github.com/vicr123/quad"
license=('GPL3')
depends=('nodejs-lts-gallium')
makedepends=('npm' 'gulp')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/Quad/archive/refs/tags/v1.1.tar.gz" 'check.js' 'local.json')
install=quad.install
sha256sums=('acae594bfbe0bdd4d452325c9787179c4d5a5d4e6cb786d0298c8cbf1da8a301'
	'5db8b740c61cc4cc3ecbbd682f3104197300937642edad8ce3bcfcab67d89713'
	'SKIP')

prepare() {
	cp "local.json" Quad-1.1/config
}

package() {
	cd Quad-1.1
     npm install --cache "$srcdir/npm-cache"
	 export DESTDIR=$pkgdir
	 gulp install
}