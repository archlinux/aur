# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

pkgname=nodejs-elm
_pkgname=elm
pkgver=0.16.0
epoch=1
pkgrel=1
pkgdesc="Binaries for the Elm programming language"
arch=(any)
url="https://www.npmjs.com/package/elm"
license=("BSD")
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('db336fe67872c99d6779a5862029b196a5a19ffc31a414abf16fd0f4d8c9fbb0')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$pkgver
}
