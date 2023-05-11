# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='openscad-threadlib'
pkgver=0.5
pkgrel=1
pkgdesc='Library containing standard threads for OpenSCAD'
url='https://github.com/adrianschlatter/threadlib'
license=(
 'BSD'
)
source=(
 "https://github.com/adrianschlatter/threadlib/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
 '94ad1834add31b5730ce9256c722d05d73543b989279b9556e1d887e79d638cb7541ba08e78268b605f10f620c790004f05f3b846f0b1e73c6ee95e9822bf897'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openscad'
 'openscad-thread-profile-git'
)

build() {
 # nop
 cat /dev/null
}

package() {
 # ensure libraries folder exists
 mkdir -p $pkgdir/usr/share/openscad/libraries/threadlib
 cd "threadlib-${pkgver}"
 install -Dm644 *.scad "$pkgdir/usr/share/openscad/libraries/threadlib"
 install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
