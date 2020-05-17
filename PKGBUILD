# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: oguzkagan <me at oguzkaganeren dot com dot tr>
#
pkgname=splashtop-streamer
pkgver=2.6.2.0
pkgrel=1
pkgdesc="Splashtop Remote Streamer. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="http://www.splashtop.com/streamer/linux"
license=('custom')
depends=('apr>=1.5.2' 'apr-util>=1.5.4' 'bash-completion>=2.7.3' 'curl>=7.47.0' 'dbus>=1.9.14' 'dbus-glib>=0.78' 'glib2>=2.12.0' 'libcurl-gnutls>=7.16.2' 'libpulse>=0.99.1' 'libutil-linux>=2.16' 'libx11' 'libxfixes' 'libxrandr>=1.2.0' 'libxtst' 'mumble' 'networkmanager' 'pam>=0.99.7.1' 'python>=2.6.1' 'python2-libappindicator')
install=${pkgname}.install
makedepends=('curl' 'p7zip')
source=(https://d17kmd0va0f0mp.cloudfront.net/linux/Splashtop_Streamer_Ubuntu_v${pkgver//_/-}_amd64.tar.gz)
sha256sums=('6d5f6d6613e3fee39af692c35228716002894c9e9f4cc4257c360e9b0e00f68e')

package ()
{
  msg "Extracting Splashtop package"
  #cd "$srcdir/$pkgname-$pkgver"
  tar -xf $srcdir/data.tar.xz -C $pkgdir
  sed -i 's/python /python2 /' $pkgdir/opt/splashtop-streamer/script/spt_main
	install -D -m644 "$pkgdir/opt/splashtop-streamer/EULA.htm" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
