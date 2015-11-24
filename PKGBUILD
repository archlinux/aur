# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=rodin
pkgver=3.0.1
pkgver_upstream=201406111447-5326174
pkgrel=1
pkgdesc="Open tool platform for the cost effective rigorous development of dependable complex software systems services."
arch=('i686' 'x86_64')
url="http://www.event-b.org"
license=('CPL' 'EPL')
depends=('python' 'libxrender' 'fontconfig' 'java-runtime')
source=(rodin.profile)
md5sums=('c9fcb488308b15325449384d0fe9c411')
sha256sums=('69193f15dabda1ee69b45744a22f0306f67793e71b629befcbd3e27c93ff5b8e')

if test "$CARCH" == x86_64; then
  source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${pkgver}.${pkgver_upstream}-linux.gtk.x86_64.tar.gz)
  md5sums+=('386e1b1a3d3e343f624e4cdda6719630')
  sha256sums+=('acbcfa9c1f9619862c20b7275eef1fdf33c54132ce2c307061867ed3bd255c13')
else
  source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${pkgver}.${pkgver_upstream}-linux.gtk.x86.tar.gz)
  md5sums+=('7f52140cc41133908b19ed8758d9b80b')
  sha256sums+=('ede945b0abde3c1167d77f1cedba15c2234671a4c8e3e65cfbfd487fad0dee2a')
fi

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/opt/rodin || return 1
  cp -rf * $pkgdir/opt/rodin || return 1
  install -m 755 -D $srcdir/rodin.profile $pkgdir/etc/profile.d/rodin.sh
}
