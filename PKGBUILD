# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=wunderline
pkgver=4.8.0
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
sha256sums=('ae87e1b6ea53db64edc4c54ab59ee74ca48ff07f8e89cb32ca9ad5ea106bcfa1')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
	rmdir "$pkgdir/usr/etc"
}
