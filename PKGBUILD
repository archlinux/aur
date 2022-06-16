#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="100.5.3"
basever="5.0"
basedist="focal"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=("x86_64" "aarch64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl")
optdepends=("mongodb-compass: The MongoDB GUI")
source_x86_64=(mongodb-org-tools_${pkgver}_x86_64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${basedist}/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-database-tools_${pkgver}_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_aarch64.deb::"https://repo.mongodb.org/apt/ubuntu/dists/${basedist}/mongodb-org/${basever}/multiverse/binary-arm64/mongodb-database-tools_${pkgver}_arm64.deb")

sha256sums_x86_64=("ef713532dd924d38072958f04111be6253c536f6170f31d0c191e5746891be39")
sha256sums_aarch64=("3161e76c740477bb76aa72610daa55ef854af113c37971145cc042c2f228aefc")

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  mkdir -p "$pkgdir/usr"
#  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
#  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
#  rm "$pkgdir/usr/bin/install_compass"
}
