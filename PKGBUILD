# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

pkgname=nodejs-elm
_pkgname=elm
pkgver=0.19.0
pkgrel=2
pkgdesc="Binaries for the Elm programming language"
arch=(any)
url="https://www.npmjs.com/package/elm"
license=("BSD")
depends=('nodejs')
makedepends=('npm')
optdepends=(
        'ncurses5-compat-libs: required by elm repl'
    )
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('cea3ee384b1bf34489d04854fada596648954e1f2cb2ea70789851c7b3b580ba')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --unsafe-perm --prefix "$pkgdir/usr" $_pkgname@$pkgver
  chmod -R go-w "$pkgdir" # force meaningful write permissions
  #rm -r "$pkgdir/usr/etc"
}
