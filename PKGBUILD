# Maintainer: mazzetta86 <mazzetta86@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov

pkgname=hdsentinel
pkgver=0.18
pkgrel=1
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
if [[ $CARCH == "i686" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel-018.gz)
  md5sums=('c7b662d1c40b331e75dedc88ecc569d9')
  _HDSentinel="hdsentinel-018"
elif [[ $CARCH == "x86_64" ]]; then
  source=(https://www.hdsentinel.com/hdslin/hdsentinel-018-x64.gz)
  md5sums=('f68fe99c6392d9b2d15a5f260d595da2')
  _HDSentinel="hdsentinel-018-x64"
elif [[ $CARCH == "armv7h" || $CARCH == "armv6h" ]]; then
  source=(https://www.hdsentinel.com/hdslin/hdsentinel-018-arm.gz)
  md5sums=('517e3bc987debeed4273dcc043853913')
  _HDSentinel="hdsentinel-018-arm"
fi

package() {
  gunzip -k -f "$_HDSentinel.gz"
  install -m755 -D $_HDSentinel $pkgdir/usr/bin/hdsentinel || return 1
}

# vim:set ts=2 sw=2 et:
