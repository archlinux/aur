#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaeff at gnome dot org>

pkgname="mongodb-tools-bin"
pkgver="100.12.0"
_basever="8.0"
_basedist="noble"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=("x86_64" "aarch64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl" "krb5")
source_x86_64=(mongodb-org-tools_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-amd64/mongodb-database-tools_${pkgver}_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${_basedist}/mongodb-org/${_basever}/multiverse/binary-arm64/mongodb-database-tools_${pkgver}_arm64.deb")

sha256sums_x86_64=('637a9036d6b269271dffb1c279d2ebb549d432c7891ec24278bfee4c8438b15c')
sha256sums_aarch64=('451cb53e4ca726cd87e30a335fa3aa8538316ab9dcf836c42c4dcf0aeab934d6')

prepare() {
  mkdir -p output
  tar xf data.tar.xz -C output
}

package() {
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
}
