# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=orthorobot
pkgver=1.0
pkgrel=5
pkgdesc='Perspective based puzzle game, where you flatten the view to move across gaps.'
arch=('i686' 'x86_64')
url="http://stabyourself.net/orthorobot/"
license=('GPL')
depends=('love07')
makedepends=('unzip')
_gamepkg=${pkgname}-linux.zip
source=("http://stabyourself.net/dl.php?file=orthorobot/orthorobot-linux.zip"
        "http://stabyourself.net/images/site/banner-orthorobot.png"
        "$pkgname.sh"
        "$pkgname.desktop")
md5sums=('3ba42cd5058660d6750cdbcb3cf477df'
         '357045580e02e973b0c9ae10399657d5'
         '4b43b2f28fe7af330b78152131fc8772'
         'd9d6a95c1382beb2ec3e75d85206eadb')

package() {
  cd "$srcdir"

  unzip -o "$srcdir/$_gamepkg" -d "$srcdir/$pkgname"

  # Start file
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Executable
  install -Dm644 "$pkgname/Ortho Robot.love" "$pkgdir/usr/share/games/$pkgname/$pkgname.love"

  # Desktop icon
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "banner-orthorobot.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
