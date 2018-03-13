# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=xscreenshot
pkgver=3.0
pkgrel=1
pkgdesc='A tool for capture, edit, share and exchange screenshots between people via the internet'
arch=('i686' 'x86_64')
# url='http://xscreenshot.com/'
url='https://sourceforge.net/projects/xscreenshot/'
license=('custom:xscreenshot')
makedepends=(chrpath)
depends=(gcc-libs xorg-xprop)
depends_i686=(libxext libxrender fontconfig)
depends_x86_64=(lib32-libxext lib32-libxrender lib32-fontconfig)
# source=("http://xscreenshot.com/downloads/$pkgname-linux-i386.tar.gz"
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/xscreenshot/files/xScreenshot%20${pkgver}/xscreenshot-linux-i386.tar.gz"
LICENSE
xscreenshot.desktop
)
sha256sums=('633fd69af66ec30ac74c08243923f09205f9fe9a11feaf42779bd7f5773a6755'
            '69d5822e7685c45ee12c473bb8032a704655a327d84e18ea02675c20a3342242'
            'c0c3b140dac3cd5395ef1c5c12cd475697a0f8efd14d6ec4bf20762087bba59c')
package(){
  cd "$srcdir"
  chrpath -d $pkgname
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/custom/$pkgname/LICENSE
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
