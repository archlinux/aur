#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaeff at gnome dot org>

pkgname="mongodb-tools-bin"
pkgver="100.9.5"
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
source_x86_64=(mongodb-org-tools_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-database-tools_${pkgver}~90481484_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-arm64/mongodb-database-tools_${pkgver}~90481484_arm64.deb")
sha256sums_x86_64=('884519c7d3c52a21cfaa9a84756eb6fdd6b93e959e3b1920b93c97d4906cc653')
sha256sums_aarch64=('25d22718c4831487e9b455a4033bcc14369e155283de09abb36455e1034a3fc3')

prepare() {
  mkdir -p output
  tar xf data.tar.xz -C output
}

package() {
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
}
