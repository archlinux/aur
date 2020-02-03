# Maintainer: Otto Ahoniemi <otto@ottoahoniemi.fi>

pkgname=routahe
_npmpkgname=routahe
pkgver=0.2.18
pkgrel=1
pkgdesc="A command line client for finding public transporation routes in
Helsinki, Finland"
arch=('any')
url='https://www.npmjs.com/package/routahe'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmpkgname/-/$_npmpkgname-$pkgver.tgz")
noextract=("$_npmpkgname-$pkgver.tgz")
sha256sums=('1a5fc95cbdf9598ad6b016714f9fe049fb080c1f243ee5715b04d58808039c7e')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmpkgname-$pkgver.tgz"
	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
	mkdir -p "${pkgdir}/usr/share/licenses/${_npmpkgname}"
	ln -s "/usr/lib/node_modules/${_npmpkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_npmpkgname}/"
}
