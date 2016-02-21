# Author: Yann Pomarede

pkgname=jcgui-git
pkgver=0.8
pkgrel=1
pkgdesc="Jc_Gui is a frontend to jconvolver"
arch=('any')
url="https://github.com/zzzzrrr/jcgui"
license=(GPL)
depends=("cairo" "pango" "atk" "gtk2" "zita-resampler")
source=("jcgui::git+https://github.com/zzzzrrr/jcgui.git")
md5sums=('SKIP')

build() { 
  cd "$srcdir/jcgui"
  python2 waf configure
  python2 waf build -j4
}

package() {
  cd "$srcdir/jcgui"
  python2 waf install --destdir=$pkgdir
}
