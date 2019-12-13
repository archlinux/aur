# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.18
pkgrel=2
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
if [[ $CARCH == "i686" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel-018.gz)
  md5sums=('6DA8AAA8F321F60B493C898195C3977C')
  _HDSentinel="hdsentinel-018"
elif [[ $CARCH == "x86_64" ]]; then
  source=(https://www.hdsentinel.com/hdslin/hdsentinel-018-x64.gz)
  md5sums=('442E28842F71D033D89FB5C4A3928BD9')
  _HDSentinel="hdsentinel-018-x64"
elif [[ $CARCH == "armv7h" || $CARCH == "armv6h" ]]; then
  source=(https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
  md5sums=('0FB42FC3FBE6EBC96558A1187222ED27')
  _HDSentinel="hdsentinel-018-arm"
fi

package() {
  gunzip -k -f "$_HDSentinel.gz"
  install -m755 -D $_HDSentinel $pkgdir/usr/bin/hdsentinel || return 1
}

# vim:set ts=2 sw=2 et:
