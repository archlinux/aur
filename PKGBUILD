# Maintainer: Ma Jiehong <email at majiehong.com>
pkgname=ttf-tw
epoch=1
pkgver=20201114
pkgrel=1
pkgdesc="Set of KAI and SONG fonts from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are calligraphically correct. (TTF/UTF-8)"
arch=('any')
url="http://www.moe.gov.tw/"
license=('CC-BY-ND 3.0')
depends=()
makedepends=('git')
conflicts=()
source=(git+https://github.com/Jiehong/TW-fonts.git)
sha512sums=('SKIP')

pkgver()
{
  cd "$srcdir/TW-fonts"
  git show --no-patch --date=short --format=format:%cd | tr -d -
}

package()
{
  cd "$srcdir"
  install -Dm644 TW-fonts/edukai-4.0.ttf "$pkgdir/usr/share/fonts/TTF/edukai-4.0.ttf"
  install -Dm644 TW-fonts/eduSong_Unicode.ttf "$pkgdir/usr/share/fonts/TTF/eduSong_Unicode.ttf"
}
