#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-iran-bin"
pkgver="100.4.0"
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

sha256sums_x86_64=("665394a7afbd0400205013ac5e0a031bfdc7fc8fe4dd460fb6b2d3035fd95de7")
sha256sums_aarch64=("a88775f540c67288531d3dd24f932e3c14b8c3b08b4ee7be63963a1af0d5d59b")

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
