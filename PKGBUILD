# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=nodejs-inshellisense
_pkgname=@microsoft/inshellisense
pkgver=0.0.1_rc.3
pkgrel=1
pkgdesc="IDE style command line auto complete"
arch=(any)
url="https://github.com/microsoft/inshellisense"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_pkgname/-/inshellisense-${pkgver//_/-}.tgz)
noextract=(inshellisense-${pkgver//_/-}.tgz)
sha256sums=('2149e7c5e0683f1999567b3ddf624ba01e1f469aba32cc6f37837d3918c7c745')

package() {
	npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/inshellisense-${pkgver//_/-}.tgz"
	install -vDm644 $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/typescript
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/@types
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/.bin
}
