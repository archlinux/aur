# Maintainer: Ma Jiehong <email at majiehong.com>
pkgname=ttf-tw
epoch=1
pkgver=20130103
pkgrel=1
pkgdesc="Set of KAI and SONG fonts from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are calligraphically correct."
arch=('any')
url="http://www.moe.gov.tw/"
license=('CC-BY-ND 3.0')
depends=('fontconfig' 'xorg-font-utils' 'git')
conflicts=()
install=ttf.install
source=(git+https://github.com/Jiehong/TW-fonts.git
  ttf.install)
sha512sums=('SKIP'
'6dde1db4c4204d89ee7d388b6f5fe972202adf4d294d18d709c94074278b8cdce129fc35ce55c62428487e4cc8df03a4c374df2e63b8406214a8a68661a1b114')
 
pkgver()
{
cd "$srcdir/TW-fonts"
git show --no-patch --date=short --format=format:%cd | tr -d -
}
 
package()
{
cd "$srcdir"
install -Dm644 TW-fonts/edukai-3.ttf "$pkgdir/usr/share/fonts/TTF/edukai-3.ttf"
install -Dm644 TW-fonts/eduSong_Unicode.ttf "$pkgdir/usr/share/fonts/TTF/eduSong_Unicode.ttf"
}
