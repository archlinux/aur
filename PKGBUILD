# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>
pkgname=ttf-fate-core
pkgver=1
pkgrel=1
pkgdesc="The ttf font used in the Fate Core Rulebook"
arch=('any')
license=('custom')
url="http://faterpg.com"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www.faterpg.com/wp-content/uploads/2013/06/Fate-Core-Font.ttf_.zip")

md5sums=('c910b1af331ab2a785d24cd51d0a0559')

package() {
  cd $srcdir
  mv 'Fate Core Font.ttf' fate-core.ttf
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
