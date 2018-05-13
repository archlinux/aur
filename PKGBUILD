# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.10.0
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
sha256sums=('eed2ed43b70cef36c1747e4f5a96f584c42ba8fcc6a80091a7c46803db3546e0')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
