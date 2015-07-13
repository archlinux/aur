# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=ttf-mgopen
pkgver=1.1
pkgrel=10
pkgdesc="TrueType fonts containing glyphs for the Latin and Greek alphabet"
arch=('any')
url="https://web.archive.org/web/20120409173416/http://www.zvr.gr/typo/mgopen/index"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
#source=(http://pub.ellak.gr/fonts/mgopen/files/MgOpen.tar.gz
source=(http://ftp.debian.org/debian/pool/main/t/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        license.txt)
sha256sums=('14a9c967b8e84c95da2e27098b45ec8f1b64a160948b091a3c6220f05186d15a'
            '2e2cbbc817d6b3e48b6aabd8d88fa800418cefe5b523d5429ce4f29480a4cad9')

package() {
  cd "$srcdir/$pkgname-$pkgver.orig/TTFs"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 MgOpen*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
