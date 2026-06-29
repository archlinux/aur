# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='allium-tools'
pkgver="3.5.0"
pkgrel=1
pkgdesc='LLM-native language for specifying what systems should do'
url='https://github.com/juxt/allium-tools'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/juxt/allium-tools/archive/refs/tags/v${pkgver}.tar.gz"
)
provides=(
 "allium"
)
sha512sums=('9e7918020644b61b24937b87f4e48b8b331f9518f3fb206078087f5dc785a39109243b09a8da9d7b66c7d0bf97c6b24a01404a551982569c0e1ee4103f612d85')
arch=(
 'x86_64'
 'i686'
)
depends=(
 'glibc'
 'gcc-libs'
)
makedepends=(
 'rust'
 'cargo'
)

build() {
 pushd "${pkgname}-${pkgver}"
 cargo build --release
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/${pkgname}-${pkgver}/target/release/allium" "$pkgdir/usr/bin/"
}
