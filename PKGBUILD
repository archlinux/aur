# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.4.2
pkgrel=1
pkgdesc="Wunderlist for your command line!"
arch=(any)
url="http://wayneashleyberry.github.io/wunderline/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('0fb0025ef451d14761f705cb49158baa3bd430624d41da0854b65c3d2535f794')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
