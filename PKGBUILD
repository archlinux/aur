# Maintainer: oguzkagan
pkgname=splashtop-streamer
pkgver=2.5.9.5
pkgrel=1
pkgdesc="Splashtop Remote Streamer. Remotely access your desktop from any device from anywhere!"
arch=('x86_64' 'i686')
url="http://www.splashtop.com/streamer/linux"
license=('custom')
depends=('apr>=1.5.2' 'apr-util>=1.5.4' 'bash-completion>=2.7.3' 'curl>=7.47.0' 'dbus>=1.9.14' 'dbus-glib>=0.78' 'glib2>=2.12.0' 'libcurl-gnutls>=7.16.2' 'libpulse>=0.99.1' 'libutil-linux>=2.16' 'libx11' 'libxfixes' 'libxrandr>=1.2.0' 'libxtst' 'mumble' 'networkmanager' 'pam>=0.99.7.1' 'python>=2.6.1' 'python2-libappindicator')
install=${pkgname}.install
makedepends=('curl' 'p7zip')
if [ "$CARCH" = "x86_64" ]; then
  source=(https://www.dropbox.com/s/03oeju0u89rcwcl/Splashtop_Streamer_Ubuntu_amd64.deb)
  md5sums=('56671123325db8a22691bc9d44d91bb1')
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
  sed -i 's/python /python2 /' $pkgdir/opt/splashtop-streamer/script/spt_main
	install -D -m644 "$pkgdir/opt/splashtop-streamer/EULA.htm" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
