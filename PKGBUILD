# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Florent Peterschmitt

_npmname=jsonlint
pkgname=nodejs-jsonlint # All lowercase
pkgver=1.6.2
pkgrel=2
pkgdesc="Validate JSON"
arch=(any)
url="http://zaach.github.com/jsonlint/"
license=('MIT')
depends=('nodejs'
         'npm')
makedepends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('4849a84bcf4864bd61c552711979e8cd')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
