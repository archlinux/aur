# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.1.7
pkgrel=1
pkgdesc="Wunderlist for your command line!"
arch=(any)
url="http://www.wunderline.rocks"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('77b472889088461534f14399b1bf6fa334b78b05a9332283416d5bb5a9054c1d')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
