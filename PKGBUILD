# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="0.6.2"
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
 '1ba7cf7c8dba24d13b212dac8730812e4ec833d20f1c7316321650412e2b07f6c842c641b2f2a00e29bc8dc78c574460494cf219e47ca2bfa29de0c85caab285'
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
