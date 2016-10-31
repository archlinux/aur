# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Borislav Lilov
pkgname=hdsentinel
pkgver=0.16
pkgrel=1
pkgdesc="A freeware, closed source, SMART analysis tool"
arch=('i686' 'x86_64')
url="http://www.hdsentinel.com/hdslin.php"
license=('unknown')
depends=()
if [[ $CARCH == "i686" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel-016.gz)
  md5sums=('4169d8e09265ca9818f6e2d04609461a')
  _HDSentinel="hdsentinel-016"
elif [[ $CARCH == "x86_64" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel-016-x64.tar.gz)
  md5sums=('2ecf56573fcb8a339fc1b2819d1b96a9')
  _HDSentinel="HDSentinel"
elif [[ $CARCH == "armv7h" ]]; then
  source=(http://www.hdsentinel.com/hdslin/hdsentinel_008_arm.gz)
  md5sums=('043b51bdad959bac5a73c094abf19472')
  _HDSentinel="hdsentinel_008_arm"
fi

package() {
  cd $srcdir
  install -m755 -D $_HDSentinel $pkgdir/usr/bin/hdsentinel || return 1
}

# vim:set ts=2 sw=2 et:
