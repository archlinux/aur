#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="100.4.1"
basever="4.4"
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

sha256sums_x86_64=("ab5c5be5ff95c44b5b6c2a00d524ed352c8794eb236f852cc0c6e3d8fbfca0b1")
sha256sums_aarch64=("cab6ac48b558c4e2b7ff84261a08aada8c3460df1a2b8def3c6b0e3ac4bf2cd8")

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
