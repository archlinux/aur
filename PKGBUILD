# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=polychord
pkgver='1.18.1'
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
sha256sums=('00e56353a48727a34e54a688d2fc021d8850ab8b6788be1c7056f1c68d417873')
package() {
    cd "${srcdir}/PolyChordLite-${pkgver}"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    make 
    install -Dm644 lib/libchord.so "$pkgdir/usr/lib/libchord.so"
    install -Dm644 lib/libchord.a "$pkgdir/usr/lib/libchord.a"
    install -Dm644 src/polychord/interfaces.hpp "$pkgdir/usr/include/${pkgname}/interfaces.hpp"
    install -Dm644 src/polychord/interfaces.h "$pkgdir/usr/include/${pkgname}/interfaces.h"
}

