#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaeff at gnome dot org>

pkgname="mongodb-tools-bin"
pkgver="100.5.4"
_basever="6.0"
_basedist="focal"
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
sha256sums_x86_64=('4ef559435b954180d84bbf1e0c626bb20e251a631d71d680acf4c664493d55af')
sha256sums_aarch64=('cd338cb3c94feab6f3b0489b4c224f15fe5e10897787181fa616b19618042ecd')

prepare() {
  mkdir -p output
  tar xf data.tar.xz -C output
}

package() {
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
}
