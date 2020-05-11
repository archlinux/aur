# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.18
pkgrel=3
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
if [[ $CARCH == "i686" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel-018c.gz)
  md5sums=('689E28DD7F9F1590B1804A81CD857F0E')
  _HDSentinel="hdsentinel-018c"
elif [[ $CARCH == "x86_64" ]]; then
  source=(https://www.hdsentinel.com/hdslin/hdsentinel-018c-x64.gz)
  md5sums=('183DC4AB98732F4D6D190532AC18DF9A')
  _HDSentinel="hdsentinel-018c-x64"
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
