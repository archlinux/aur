# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=degit
pkgver=3.8.0
pkgrel=1
pkgdesc="Straightforward project scaffolding"
arch=('any')
url='https://github.com/Rich-Harris/degit'
license=('MIT')
depends=('nodejs>=8')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f87924fd011545de2f516e6aefe79e293bb95aebef3f164f1bcbd1b46fb6cb71')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
