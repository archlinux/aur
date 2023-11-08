# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=nodejs-inshellisense
_pkgname=@microsoft/inshellisense
pkgver=0.0.1_rc.2
pkgrel=1
pkgdesc="IDE style command line auto complete"
arch=(any)
url="https://github.com/microsoft/inshellisense"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_pkgname/-/inshellisense-${pkgver//_/-}.tgz)
noextract=(inshellisense-${pkgver//_/-}.tgz)
sha256sums=('fd9c289180b56e7809c79472ec162eb15bc8a6e512e864eaf85b9f061524a83e')

package() {
	npm install --omit=dev -g --prefix "${pkgdir}/usr" "${srcdir}/inshellisense-${pkgver//_/-}.tgz"
	install -vDm644 $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/typescript
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/@types
	rm -r $pkgdir/usr/lib/node_modules/@microsoft/inshellisense/node_modules/.bin
}
