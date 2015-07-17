# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-beteckna
pkgver=0.4
pkgrel=1
pkgdesc="A geometric sans serif typeface inspired by the popular Futura"
arch=('any')
url="https://web.archive.org/web/20130517030302/http://gnu.ethz.ch/linuks.mine.nu/beteckna/"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge')
install=ttf.install
source=(https://web.archive.org/web/20130517030302/http://gnu.ethz.ch/linuks.mine.nu/beteckna/beteckna-$pkgver.tar.gz)
sha256sums=('7b2d02e82422c0d4f5550cb8c3679e0549343bad49b261673c04f44dda8ee307')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  fontforge -script sfd2ttf.ff *.sfd 2> /dev/null
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

# vim:set ts=2 sw=2 et:
