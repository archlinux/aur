# Maintainer: dracorp aka Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=xflux-gui-git
pkgver=0b562044
pkgrel=1
pkgdesc='Better lighting for Linux. Open source GUI for xflux'
arch=(any)
url='https://justgetflux.com/linux.html'
license=(MIT)
provides=(xflux-gui)
conflicts=(xflux-gui)
depends=(
hicolor-icon-theme
libappindicator-sharp
python2-pexpect
python2-gconf
xflux
)
makedepends=(git)
install='xflux-gui.install'
source=('git://github.com/xflux-gui/xflux-gui.git')
_gitname='xflux-gui'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}
package(){
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir"
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/xflux-gui-git/LICENSE
}
