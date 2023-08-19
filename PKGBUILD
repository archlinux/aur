#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
#Maintainer: Rafael Fontenelle <rafaeff at gnome dot org>

pkgname="mongodb-tools-bin"
pkgver="100.8.0"
_basever="6.0"
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
sha256sums_x86_64=('4fdec16424fc2d33b70691549ff2a19885180259f1358998ed29475a88ca1c46')
sha256sums_aarch64=('137b719c3978f20526f294e5022084460319077e0ab6801c621ef7a288559102')

prepare() {
  mkdir -p output
  tar xf data.tar.xz -C output
}

package() {
  install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
}
