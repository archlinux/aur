# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=pcf-unifont
pkgver=17.0.01
pkgrel=1
pkgdesc="GNU Unifont Glyphs (PCF version)"
arch=('any')
url="https://unifoundry.com/unifont/"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.pcf.gz"{,.sig}
        "unifont-LICENSE.txt::https://unifoundry.com/LICENSE.txt")
noextract=("unifont-$pkgver.pcf.gz")
sha256sums=('8240c381398a21f4eef993d16f0976d6a627e61054f0add275d195408f24efa9'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

package() {
  cd "$srcdir"
  install -Dm644 "unifont-$pkgver.pcf.gz" "$pkgdir/usr/share/fonts/misc/unifont.pcf.gz"
  install -Dm644 unifont-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
