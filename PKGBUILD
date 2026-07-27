# Maintainer: Ian Emnace <igemnace@gmail.com>

pkgname=degit
pkgver=3.6.4
pkgrel=1
pkgdesc="Straightforward project scaffolding"
arch=('any')
url='https://github.com/Rich-Harris/degit'
license=('MIT')
depends=('nodejs>=8')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('84df39a2d82a736f07721c28afda4b1dcd7d5d0ea59d6ff18c6390d3aba89b30')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
