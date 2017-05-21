# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump2
_pkgname=elasticdump
pkgver=2.4.2
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch < 5"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('a579d818b0475e9f99d5429a652e34f89c8d4f246bb9c649cb0748009ce6720c')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"

  mv "$pkgdir/usr/lib/node_modules/$_pkgname" "$pkgdir/usr/lib/node_modules/$pkgname"
  mv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/bin/multi$_pkgname" "$pkgdir/usr/bin/multi$pkgname"
}
