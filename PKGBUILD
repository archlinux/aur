# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=rodin
pkgver=3.2
pkgver_upstream=0.201506220911-ecacdcb
pkgrel=1
pkgdesc="Tool for cost effective rigorous development of dependable software systems"
arch=('i686' 'x86_64')
url="http://www.event-b.org"
license=('CPL' 'EPL')
depends=('python' 'libxrender' 'fontconfig' 'java-runtime')
source=('rodin.desktop')
md5sums=('b9941b26369aff6665dcde43091ebef9')
sha256sums=('aa4c0909b4e156f20882a1b861c6a7b37d144a18e9fe7fa00088b9dc2f586d75')

if test "$CARCH" == x86_64; then
  source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${pkgver}.${pkgver_upstream}-linux.gtk.x86_64.tar.gz)
  md5sums+=('2da46b2fd30ae5dff7d466baf475bf55')
  sha256sums+=('36e3ac4ab30586f12bd552902e9afb4e50a4bd3cb711ee4f9becbec88ea5385e')
else
  source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${pkgver}.${pkgver_upstream}-linux.gtk.x86.tar.gz)
  md5sums+=('7f52140cc41133908b19ed8758d9b80b')
  sha256sums+=('ede945b0abde3c1167d77f1cedba15c2234671a4c8e3e65cfbfd487fad0dee2a')
fi

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/opt/rodin || return 1
  cp -rf * $pkgdir/opt/rodin || return 1
  mkdir -p $pkgdir/usr/share/pixmaps
  install $pkgdir/opt/rodin/icon.xpm $pkgdir/usr/share/pixmaps/rodin.xpm
  mkdir -p $pkgdir/usr/share/applications
  install -m 755 $srcdir/rodin.desktop $pkgdir/usr/share/applications/rodin.desktop
  #install -m 755 -D $srcdir/rodin.profile $pkgdir/etc/profile.d/rodin.sh
}
