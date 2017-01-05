# Contributor: Storm Dragon <stormdragon2976@gmail.com>
pkgname=rsgames
pkgver=1.6
pkgrel=1
pkgdesc="A collection of board, card, and dice games in audio format played online"
arch=('any')
url="http://www.rsgames.org/"
source=("$pkgname.desktop" "$pkgname.sh" "http://rsgames.org/rsdownloads/rsgclient/rsg-client-dist-1.6-release.zip")
license=('Custom')
depends=('python2-speechd' 'wxpython' 'wxgtk2.8' 'python2-crypto' 'python2-configobj' 'python2-faulthandler')
makedepends=('unzip')
optdepends=('espeak: TTS support')
provides=("$pkgname")
conflicts=("$pkgname")
install="$pkgname.install"
md5sums=('109b93bd034fecd5389b68d9bc177547'
         '4df8c8964b8ba2f00f6c97aece344e94'
         'c1946315bc225ef7d90fa6110e3ef948')

package()
 {
  msg "Starting to build the package..."

  unzip -d "$srcdir/$pkgname" rsg-client-linux-$pkgver.py27.zip
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/opt/$pkgname"
  cp -a * "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
