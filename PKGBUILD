# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=degit
pkgver=3.6.2
pkgrel=1
pkgdesc="Straightforward project scaffolding"
arch=('any')
url='https://github.com/Rich-Harris/degit'
license=('MIT')
depends=('nodejs>=8')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('daefe51fdc92a2442403840eb228a3f45d2612058cfe4c53a5fd410a5be9f908')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
