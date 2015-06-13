# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=orthorobot
pkgver=1.0
pkgrel=4
pkgdesc='Perspective based puzzle game, where you flatten the view to move across gaps'
arch=('i686' 'x86_64')
url="http://stabyourself.net/orthorobot/"
license=('GPL')
depends=('love07')
makedepends=('unzip')
_gamepkg=${pkgname}-linux.zip
source=(http://stabyourself.net/dl.php?file=orthorobot/orthorobot-linux.zip
        https://bitbucket.org/rude/love/raw/0.7.0/platform/unix/app.svg
        $pkgname.sh
        $pkgname.desktop)
md5sums=('3ba42cd5058660d6750cdbcb3cf477df'
         'a1e19f91420cc519a683af360f5b1120'
         '4b43b2f28fe7af330b78152131fc8772'
         '4d5757d30b2b07c9062d3fe02ce65a57')

package() {
  cd $srcdir

  unzip -o $srcdir/$_gamepkg -d $srcdir/$pkgname

  # Start file
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname

  # Executable
  install -Dm644 $pkgname/Ortho\ Robot.love $pkgdir/usr/share/games/$pkgname/$pkgname.love

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 app.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
}