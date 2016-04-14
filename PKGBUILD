# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=tintin-alteraeon
pkgver=3
pkgrel=2
pkgdesc="Play Alter Aeon with sounds and other game enhancements. Uses the tintin++ mud client."
arch=('any')
url="http://github.com/stormdragon2976/$pkgname"
license=('WTFPL')
depends=('opusfile' 'opus-tools' 'sox' 'tintin' 'wget')
makedepends=('git')
optdepends=('cmus: Music player'
	'mpd: Music player'
	'pianobar: Music player'
	'xmms2: Music player')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+git://github.com/stormdragon2976/${pkgname}.git" "${pkgname}.install")
install="${pkgname}.install"
md5sums=('SKIP'
         '426749651ec37b01dd4f43f35a1c34ba')


#pkgver()
#{
  #cd "$srcdir/$pkgname"
  #git shortlog | head -n 1 | tr -Cd "[:digit:]"
#}
 
package()
 {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/opt/$pkgname"
  install -m755 "$pkgname/contrib/$pkgname" "$pkgdir/usr/bin/$pkgname"
cp -a * "$pkgdir/opt/"
install -Dm644 "$srcdir/$pkgname/contrib/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
install -Dm644 "$srcdir/$pkgname/contrib/alteraeon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/alteraeon.svg"
  }

# vim:set ts=2 sw=2 et:
