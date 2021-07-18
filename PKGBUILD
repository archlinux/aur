#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="100.4.0"
basever="4.4"
basedist="focal"
pkgrel="2"
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

sha256sums_x86_64=("4f65de24640ad86e51988616c58e3813e024427c88879218d0a4d245bdad24e5")
sha256sums_aarch64=("572adc95660bb137ff2a74ee74873e71fd1ea5405415b81b21696c8ed722147f")

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
