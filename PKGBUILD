# Maintainer: Ckat <ckat@teknik.io>
# Contributer: neeshy <neeshy@tfwno.gf>
pkgname=otb-unifont
pkgver=17.0.05
pkgrel=1
pkgdesc="GNU Unifont Glyphs (OTB version)"
arch=('any')
url="https://unifoundry.com/unifont/"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('xorg-fonttosfnt')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "unifont-LICENSE.txt::https://unifoundry.com/LICENSE.txt")
sha256sums=('db0111c066edfe7583f0d77adbecbba463f00643a37dc3b9651ae9349543487f'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

build() {
  cd "$srcdir"
  fonttosfnt -c -b -m 2 -o unifont.otb "unifont-$pkgver.bdf"
}

package() {
  cd "$srcdir"
  install -Dm644 unifont.otb "$pkgdir/usr/share/fonts/misc/unifont.otb"
  install -Dm644 unifont-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
