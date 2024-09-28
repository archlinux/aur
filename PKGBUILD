# Maintainer: k35mf <aur.k35mf@dralias.com>
# Reference: PKGBUILD(5)

pkgname=otf-baskervillef
pkgver=1.051
pkgrel=1
pkgdesc="A PDF-optimized serif font, fork of Libre Baskerville, with added Bold Italic style."
url="https://ctan.org/pkg/baskervillef"
license=(custom:OFL)
arch=(any)
source=("https://mirrors.ctan.org/fonts/baskervillef.zip")

# Warning: checksums provided by packager, not upstream
b2sums=('695e455f35c2062c7fa30ec6ea62f52ee6ed6ac91ba8e28a717c0e1af4a3eccc4e315be26d1dd6822bc6993a1d4af630dc26caf1abb55ce060cea1efaa1f96e5')

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

