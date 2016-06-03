# Maintainer: Jeffrey Lin <anaveragehuman.0 AT gmail DOT com>
# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=5.3.1
pkgrel=2
pkgdesc="A multi-agent programmable modeling environment."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _NARCH=32
[ "$CARCH" = "x86_64" ] && _NARCH=64
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-environment')
optdepends=('alsa-lib' 'libnet' 'gtk2' 'gcc-libs-multilib')
install=$pkgname.install
source=(http://ccl.northwestern.edu/netlogo/$pkgver/NetLogo-$pkgver-$_NARCH.tgz)
md5sums=('f1f2d0499ac007bc84f9de9d95f90cdd')

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/opt/$pkgname
  cd $srcdir/$pkgname-$pkgver-$_NARCH
  cp -r * $pkgdir/opt/$pkgname
  for file in {NetLogo,NetLogo3D,NetLogoLogging,HubNetClient}; do
	chmod +x $pkgdir/opt/$pkgname/$file
  	ln -s /opt/$pkgname/$file $pkgdir/usr/bin/
  done
}
