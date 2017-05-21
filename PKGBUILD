# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump2
_pkgname=elasticdump
pkgver=2.4.0
pkgrel=2
pkgdesc="Import and export tools for Elasticsearch < 5"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('e344d622ef2cc4f6cfbd9e9901b6713ddd3b45d55062ce4c11ab04632efc37de')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"

  mv "$pkgdir/usr/lib/node_modules/$_pkgname" "$pkgdir/usr/lib/node_modules/$pkgname"
  mv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/bin/multi$_pkgname" "$pkgdir/usr/bin/multi$pkgname"
}
