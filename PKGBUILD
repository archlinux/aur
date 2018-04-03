pkgname=parcel-bundler
pkgver=1.7.0
pkgrel=2
pkgdesc="Blazing fast, zero configuration web application bundler"
arch=(any)
url="https://parceljs.org/"
license=()
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  cd $pkgdir
  rmdir usr/etc
  find -perm -o+w -exec chmod o-w "{}" "+"
}

# vim:set ts=2 sw=2 et:
sha256sums=('bd20b5bff21972ccdaabca592a1f82583e3f261e2a851f6cdb2bf2d0fb1aec2e')
