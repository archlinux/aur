# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="0.6.0"
pkgrel=0
pkgdesc='The design doc tool made for developers'
url='http://vitiral.github.io/artifact/'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/vitiral/artifact/archive/v${pkgver}.tar.gz"
)
sha512sums=(
 '65feb9c77ef568d7399bb3212a0b900209b309ba45b38c13ed7fe8368d07c3ece865a90aa1a33daeb90ed84bc9fd2f2a9ca8b63d45ec41b16ba8b3882c4e074e'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'glibc'
 'gcc-libs'
)
# Currently, this package needs serde_derive v0.9.9, which needs nightly rust.
makedepends=(
 'rust-nightly'
 'cargo'
)

build() {
 pushd "artifact-${pkgver}"
 cargo build --release
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/artifact-${pkgver}/target/release/art" "$pkgdir/usr/bin/"
}
