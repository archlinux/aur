# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-amerika
_realname=Amerika
pkgver=1
pkgrel=2
pkgdesc="Amerika and America Sans True Type Fonts by: Apostrophic"
arch=('any')
license=('custom')
url="http://apostrophiclab.pedroreina.net/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$url/0116-$_realname/amerika_tt.zip"
        "$url/0151-${_realname}Sans/amsans_tt.zip"
        "http://apostrophiclab.pedroreina.net/info.html")

md5sums=('6acff33aeb2a96050379133da38a7d05'
         'cc215f213eb885f9004c3f460a9a88c2'
         '4818882329ff74df4a1bee06f05974a1')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.html $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
