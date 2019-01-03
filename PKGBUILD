# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
pkgname=splashtop-streamer
pkgver=2.2.5.1_4
pkgrel=7
pkgdesc="Remotely access your desktop from any device from anywhere! - Server version"
arch=('x86_64' 'i686')
url="http://www.splashtop.com/streamer/linux"
license=('custom')
depends=('python2' 'python2-keyring' 'python2-crypto' 'apr' 'apr-util' 'dbus' 'dbus-glib' 'glib2' 'libpulse' 'openssl' 'util-linux' 'libx11' 'libx264' 'libxfixes' 'libxrandr' 'libxtst' 'libappindicator-gtk2' 'networkmanager' 'python2-libappindicator')
makedepends=('curl' 'p7zip')
if [ "$CARCH" = "x86_64" ]; then
  source=(http://d17kmd0va0f0mp.cloudfront.net/linux/Splashtop_Streamer_Ubuntu_14.04_v${pkgver//_/-}_amd64.deb
  splashtop-streamer)
  md5sums=('d56f08bb08b0a58b65c64bd3a8f7a4b4'
  '9867062d727d41fff1ba47cf9bc501a1')
else
  source=(http://d17kmd0va0f0mp.cloudfront.net/linux/Splashtop_Streamer_Ubuntu_14.04_v${pkgver//_/-}_i386.deb
  splashtop-streamer)
  md5sums=('d9806b33adeb6ea11a6e992f513b9e83'
  '9867062d727d41fff1ba47cf9bc501a1')
fi

package ()
{
  msg "Extracting Splashtop package"
  #cd "$srcdir/$pkgname-$pkgver"
  tar -xf $srcdir/data.tar.xz -C $pkgdir
  sed -i 's/python /python2 /' $pkgdir/usr/share/applications/SplashtopStreamer.desktop

  msg "Creating custom executable in /usr/bin"
  mkdir -p $pkgdir/usr/bin
  cp splashtop-streamer $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
