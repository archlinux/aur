# Maintainer: k35mf <aur.k35mf@dralias.com>
# Reference: PKGBUILD(5)

pkgname=otf-baskervillef
pkgver=1.052
pkgrel=1
pkgdesc="A PDF-optimized serif font, fork of Libre Baskerville, with added Bold Italic style."
url="https://ctan.org/pkg/baskervillef"
license=(custom:OFL)
arch=(any)
source=("https://mirrors.ctan.org/fonts/baskervillef.zip")

# Warning: checksums provided by packager, not upstream
b2sums=('016aa088325eccdce4ac29bcc5b53ddcd0ce2eeece6fa634fc688220b5bfc1817c161fadbe1ce2616cfd5832eb2ebae6880ffd8323037fde5f4a602ee340beed')

pkgver() {
  cd "$srcdir/baskervillef"
  cat README | grep "Current version:" | cut -s -d " " -f 3
}

package() {
  cd "$srcdir/baskervillef/opentype/"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" BaskervilleF-*.otf
  cd "$srcdir/baskervillef/doc/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:

