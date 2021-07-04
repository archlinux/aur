# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.15.5
pkgrel=1
pkgdesc='The MongoDB Shell includes all features of legacy mongo shell with new syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('Apache')
optdepends=('mongodb-bin')
provides=("mongosh")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux-x64.tgz")
sha256sums=("d57657a58d0f10f8ecb84be41223b78e82381cb269d046c2f7ec1a782e2cf41b")
options=(!strip)
package() {
  cd $srcdir/mongosh-$pkgver-linux-x64/
  install -Dm755 ./bin/mongosh $pkgdir/usr/bin/mongosh
  install -Dm755 ./bin/mongocryptd-mongosh $pkgdir/usr/bin/mongocryptd-mongosh
  install -Dm644 ./THIRD_PARTY_NOTICES $pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_NOTICES
  install -Dm644 ./LICENSE-mongocryptd $pkgdir/usr/share/doc/$pkgname/LICENSE-mongocryptd
  install -Dm644 ./README $pkgdir/usr/share/doc/$pkgname/README
}
