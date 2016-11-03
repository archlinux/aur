# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.4.3
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
sha256sums=('20a76389050f54ddc02188b21879ffe4681322528fcb159137f585378d06bef6')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
