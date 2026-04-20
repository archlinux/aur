# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='allium-tools'
pkgver="3.0.5"
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
sha512sums=('e724930b95e8eada3e2bda4523950053fecf17b4c695772c95b84fade080a582d6515a9be8b761838a63d384fc13db9ceb97f28368267892a0b5a4d7407cfaad')
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
