# Author: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me/)

_npmname=wunderline
pkgname=nodejs-wunderline # All lowercase
pkgver=4.1.3
pkgrel=1
pkgdesc="Wunderlist for your command line!"
arch=(any)
url="http://www.wunderline.rocks"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('efff7103fb8aace56e606efb33bb9d5adb35b669')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
