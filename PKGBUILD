# Contributor: kaptoxic
# Contributor: sseneca
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=rodin
pkgver=3.4
pkgver_upstream=0.201802230927-6980ca1
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
  md5sums+=('c9869435fcb8180620aa1d91d8cfa7ad')
  sha256sums+=('5c7f923ae8219c779f9bfe3550ef2eebc15162998faadc3c5ba9ac8408048729')
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
