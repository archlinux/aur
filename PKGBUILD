# Maintainer: Aman Sinha

pkgname=mongodb-shell
pkgver=0.13.1
pkgrel=1
pkgdesc='The MongoDB Shell includes all features of legacy mongo shell with new syntax highligting, clear error messages and intelligent autocomplete.'
url='https://www.mongodb.com/'
license=('Apache')
optdepends=('mongodb-bin')
provides=("mongosh")
arch=('x86_64')
source=("https://downloads.mongodb.com/compass/mongosh-$pkgver-linux-x64.tgz")
sha256sums=("36183d7735614e9d009d90875f2c0742b319d25e6578fc77dafdeac22a79f07d")
options=(!strip)
package() {
  cd $srcdir
  install -Dm755 ./bin/mongosh $pkgdir/usr/bin/mongosh
  install -Dm755 ./bin/mongocryptd-mongosh $pkgdir/usr/bin/mongocryptd-mongosh
  install -Dm644 ./THIRD_PARTY_NOTICES $pkgdir/usr/share/doc/$pkgname/THIRD_PARTY_NOTICES
  install -Dm644 ./LICENSE-mongocryptd $pkgdir/usr/share/doc/$pkgname/LICENSE-mongocryptd
  install -Dm644 ./README $pkgdir/usr/share/doc/$pkgname/README
}
