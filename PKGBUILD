# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=degit
pkgver=3.6.6
pkgrel=1
pkgdesc="Straightforward project scaffolding"
arch=('any')
url='https://github.com/Rich-Harris/degit'
license=('MIT')
depends=('nodejs>=8')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('9b312db9f343aa471fb5c032a70ae188ba7e32761009e360c7d889723ec850d6')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
