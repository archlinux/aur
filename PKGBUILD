# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: jhrdka
# Contributor: Isaac Aggrey <isaac.aggrey@gmail.com>
# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=bin32-lightscribe
_realname=lightscribe
pkgver=1.18.27.10
pkgrel=3
pkgdesc="LightScribe Host Software for Linux"
arch=('x86_64')
url="http://www.lightscribe.com/downloadsection/linux/index.aspx?id=1372"
license=('custom')
depends=('lib32-libstdc++5')
makedepends=('rpmextract')
#source=(http://download.lightscribe.com/ls/$_realname-$pkgver-linux-2.6-intel.rpm)
source=(http://www.pawtec.com/lightscribe_files/Linux/LSS/$_realname-$pkgver-linux-2.6-intel.rpm)
sha256sums=('069703c3b5a572191f53697fcccb83504bb1c2405382d02d952fe5d4f12f2643')

package() {
  cd $srcdir
  rpmextract.sh $_realname-$pkgver-linux-2.6-intel.rpm 2> /dev/null
  rm usr/lib/lightscribe/libstdc++.so.5.0.7
  mv etc usr $pkgdir
  install -D -m644 $pkgdir/usr/share/doc/lightscribeLicense.rtf $pkgdir/usr/share/licenses/lightscribe/license.rtf
}
