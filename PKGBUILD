# Maintainer Martin Meszaros <moert09 AT gmail DOT com>

pkgname=saba-meeting-client-bin
pkgver="8.5.0.078"
pkgrel=1
pkgdesc="Software Client allowing to participate on Saba web-meetings and e-classrooms."
arch=('x86_64')
url="https://www.saba.com/us/apps/collaboration/"
license=('unknown')
depends=('lib32-libxtst' 'lib32-alsa-lib' 'lib32-libxrender' 'lib32-libxmu' 'lib32-fontconfig')
source=("http://mt202.sabameeting.com/SiteRoots/main/Install/linux/SabaMeetingClient.rpm.gz")
md5sums=('d5ea7d2dc3822db745569e50f2d74d41')

package() {
  bsdtar -xf SabaMeetingClient.rpm -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/lib/mozilla/plugins"
  mv "$pkgdir/usr/lib/firefox/plugins/npCentraUpdaterPlugIn.so" "$pkgdir/usr/lib/mozilla/plugins"
  rm -r "$pkgdir/usr/lib/firefox/"
}
