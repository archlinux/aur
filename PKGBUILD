# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.3.1
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
sha256sums=('1f71c98caee88a740ba7117c37eb7cc349351140706224a9000614b1e1bf650f')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
