# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

pkgname=nodejs-elm
_pkgname=elm
pkgver=0.17.1
pkgrel=1
pkgdesc="Binaries for the Elm programming language"
arch=(any)
url="https://www.npmjs.com/package/elm"
license=("BSD")
depends=('nodejs')
makedepends=('npm')
optdepends=(
        'libtinfo: required by elm repl'
    )
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('2b42dbe46e2066a29360998c1c3c8d8521f3d28eb6ac11ee11fd41eac8c26324')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --unsafe-perm --prefix "$pkgdir/usr" $_pkgname@$pkgver
  rm -r "$pkgdir/usr/etc"
}
