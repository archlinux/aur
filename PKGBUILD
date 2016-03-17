# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=xscreenshot
pkgver=3.1
pkgrel=2
pkgdesc='A tool for capture, edit, share and exchange screenshots between people via the internet'
arch=('i686' 'x86_64')
url='http://xscreenshot.com/'
license=('custom:xscreenshot')
depends=(gcc-libs)
depends_i686=(libxext libxrender fontconfig)
depends_x86_64=(lib32-libxext lib32-libxrender lib32-fontconfig)
install='xscreenshot.install'
source=("http://xscreenshot.com/downloads/$pkgname-linux-i386.tar.gz"
LICENSE
xscreenshot.desktop
)
sha256sums=('732644c22db08a8795a11cc39b78d7b5d7f1833f89cacd5be0e52e859dc5a2cf'
            '69d5822e7685c45ee12c473bb8032a704655a327d84e18ea02675c20a3342242'
            '0679947c58813507c57e72c07a3b8f41c7e83c50b632103396dd30fd36ac723f')
package(){
  cd "$srcdir"
  if which chrpath &>/dev/null; then
    chrpath -d $pkgname
  fi
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/custom/$pkgname/LICENSE
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
