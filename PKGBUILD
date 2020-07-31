# Contributor: Ondřej Šponar
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lexend-fonts-git
pkgver=1.1.r30.ebb64d5
pkgrel=1
pkgdesc='Lexend is a variable typeface designed to improve reading fluency'
url="https://lexend.com"
arch=(any)
license=(custom:OFL-1.1)
makedepends=('git')
conflicts=('lexend-fonts')
provides=('lexend-fonts')
source=('lexend-fonts-git::git+https://github.com/ThomasJockin/lexend')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" $(grep Version README.md |tail -1|cut -d" " -f7) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  install -Dm644 $pkgname/fonts/ttf/LexendDeca-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendDeca-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendExa-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendExa-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendGiga-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendGiga-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendMega-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendMega-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendPeta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendPeta-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendTera-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendTera-Regular.ttf"
  install -Dm644 $pkgname/fonts/ttf/LexendZetta-Regular.ttf "$pkgdir/usr/share/fonts/TTF/LexendZetta-Regular.ttf"
  install -Dm644 $pkgname/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

