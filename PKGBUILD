_npmname=http-master
pkgname=nodejs-http-master # All lowercase
pkgver=1.2.7
pkgrel=1
pkgdesc="a front end http service with with easy setup of reverse proxy/redirecting/other-actions logic"
arch=(any)
url="https://github.com/encharm/http-master"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('8bc58d1a293a7be51401612acd034561ff16d14b')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
#    rmdir "$pkgdir/usr/etc"
}
