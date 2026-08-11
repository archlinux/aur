# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='allium-tools'
pkgver="3.5.3"
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
sha512sums=('a8294550f8dff4310366bf26b1558d6863f7a9a14cdaa754f32fc6134b9c70d38fab27a34f168907e52437fb6f40e7178b3a701085f6a4799813240c164b100c')
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
