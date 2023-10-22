#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaeff at gnome dot org>

pkgname="mongodb-tools-bin"
pkgver="100.9.0"
_basever="7.0"
_basedist="focal"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=("x86_64" "aarch64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl-1.1" "krb5")
source_x86_64=(mongodb-org-tools_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-database-tools_${pkgver}_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-arm64/mongodb-database-tools_${pkgver}_arm64.deb")
sha256sums_x86_64=('f3763aa07669f1b35b67661cbb8f2510651084ce8e467d719721a4d2c6be1fed')
sha256sums_aarch64=('f825a6bb2ce137f2540c4d0c93d9217b0e2946acf0b2ce17289886dc33ef5857')

prepare() {
  mkdir -p output
  tar xf data.tar.xz -C output
}

package() {
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
}
