# Maintainer: bert@bertptrs.nl
pkgname=bower-away
pkgver=1.1.2
pkgrel=1
pkgdesc="Convert your project from Bower to Yarn"
arch=('any')
url="https://github.com/sheerun/bower-away"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/bower-away/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('e9a3d70b39fe388768f4c2efc931a2f199fc68f90e6c310ea51d02f2d58a6db2')

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
	# Remove references to $pkgdir
	find "$pkgdir" -type f -print0 | xargs -0 sed -i "/_where/d"
}
