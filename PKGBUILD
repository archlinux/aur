# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=mongochef
pkgver=3.0.5
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://3t.io/mongochef/"
license=("custom")
depends=('java-runtime>=1.6')
makedepends=('unzip')
provides=('mongochef')

source=("mongochef.desktop")
source_i686=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x86-dist.tar.gz")
source_x86_64=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x64-dist.tar.gz")

sha256sums=('2a84561b36358ac9bc9323eeee4f610a55d5e4af67b1e3986764a801e2400671')
sha256sums_i686=('70eca864fad16bcb675c28238992b598722f91b1a64ae458c777156d1296bb1f')
sha256sums_x86_64=('1b062cd196e26ef5998b85a7fadbbcb0fb6759cb6553c3b7cb4197c198198ad8')

prepare() {
  unzip -j $srcdir/${pkgname}-$pkgver-linux-*-dist/lib/data-man-gui-$pkgver.jar "t3/dataman/icons/*" -d "icons"
  unzip -j $srcdir/${pkgname}-$pkgver-linux-*-dist/lib/data-man-mongodb-pro-$pkgver.jar "t3/utils/gui/3T-EULA.txt" -d "./"
}

package() {
  cd $pkgdir
  mkdir -p opt/

  cp -r $srcdir/${pkgname}-$pkgver-linux-*-dist/lib opt/${pkgname}
  install -D -m 644 $srcdir/icons/mc-16.png usr/share/icons/hicolor/16x16/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-24.png usr/share/icons/hicolor/24x24/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-32.png usr/share/icons/hicolor/32x32/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-40.png usr/share/icons/hicolor/40x40/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-48.png usr/share/icons/hicolor/48x48/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-64.png usr/share/icons/hicolor/64x64/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-128.png usr/share/icons/hicolor/128x128/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-256.png usr/share/icons/hicolor/256x256/apps/mongochef.png
  install -D -m 644 $srcdir/icons/mc-512.png usr/share/icons/hicolor/512x512/apps/mongochef.png
  install -D -m 644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
  install -D -m 644 $srcdir/3T-EULA.txt $pkgdir/usr/share/licences/${pkgname}/3T-EULA.txt
}
