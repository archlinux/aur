# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=polychord
pkgver=1.22.2
pkgrel=1
pkgdesc="Next generation nested sampling"
arch=(any)
url="https://github.com/PolyChord/PolyChordLite"
groups=()
depends=('gcc-fortran' 'openmpi')
license=('custom')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/PolyChord/PolyChordLite/archive/${pkgver}.tar.gz")
sha256sums=('f7407a3ad24cba9f0f0fef41e1f3646d72d1c308355e20b21abc222c17cb3509')
package() {
    cd "${srcdir}/PolyChordLite-${pkgver}"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    make 
    install -Dm644 lib/libchord.so "$pkgdir/usr/lib/libchord.so"
    install -Dm644 lib/libchord.a "$pkgdir/usr/lib/libchord.a"
    install -Dm644 src/polychord/interfaces.hpp "$pkgdir/usr/include/${pkgname}/interfaces.hpp"
    install -Dm644 src/polychord/interfaces.h "$pkgdir/usr/include/${pkgname}/interfaces.h"
}

