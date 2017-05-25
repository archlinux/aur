# Contributor: kaptoxic
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=rodin
pkgver=3.3
pkgver_upstream=0.201704022034-f9fbb0d
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
  md5sums+=('3b68c78b70e53199243b7d447d3d1aa5')
  sha256sums+=('2f685073f034f29dac67e02d8529b1f4436798fbe896163f7f35e67335110517')
else
  source+=(http://downloads.sourceforge.net/project/rodin-b-sharp/Core_Rodin_Platform/${pkgver}/rodin-${pkgver}.${pkgver_upstream}-linux.gtk.x86.tar.gz)
  md5sums+=('4ecb200a1b23a74cf45d757666d12510')
  sha256sums+=('29dd52d3a560a6e832213af9040afac1ae865e67b01145a24e0f3780f110d7b0')
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
