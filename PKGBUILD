#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-iran-bin"
pkgver="100.3.1"
basever="4.4"
basedist="focal"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities. (Iran Mirror)"
arch=("x86_64" "aarch64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl")
optdepends=("mongodb-compass: The MongoDB GUI")
source_x86_64=(mongodb-org-tools_${pkgver}_x86_64.deb::"https://downloads.tuxfamily.org/molaeiorg/mongo-mirror/mongodb-database-tools_${pkgver}_amd64.deb")
source_aarch64=(mongodb-org-tools_${pkgver}_aarch64.deb::"https://downloads.tuxfamily.org/molaeiorg/mongo-mirror/mongodb-database-tools_${pkgver}_arm64.deb")

sha256sums_x86_64=("21872a9ac42d7575d4ff5c764bccada525b8715cf2b159194cff3ccc45453728")
sha256sums_aarch64=("595fbdb4e7049b1361e76594f74c83544e3afea21565ae40fb60858761210bcf")

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
