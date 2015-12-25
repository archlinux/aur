# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

pkgname=nodejs-elm
_pkgname=elm
pkgver=0.16.0
epoch=1
pkgrel=2
pkgdesc="Binaries for the Elm programming language"
arch=(any)
url="https://www.npmjs.com/package/elm"
license=("BSD")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('db336fe67872c99d6779a5862029b196a5a19ffc31a414abf16fd0f4d8c9fbb0')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --unsafe-perm --prefix "$pkgdir/usr" $_pkgname@$pkgver
  rm -r "$pkgdir/usr/etc"
}
