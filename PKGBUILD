# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributer: Eduard Bopp <eduard dot bopp at aepsil0n dot de>

pkgname=nodejs-elm
_pkgname=elm
pkgver=0.18.0
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
sha256sums=('2c189789b3b7a097c35b4370a0bfb2afe806b70e7bf9d402f174d528eea034d5')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --unsafe-perm --prefix "$pkgdir/usr" $_pkgname@$pkgver
  rm -r "$pkgdir/usr/etc"
}
