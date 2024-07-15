pkgname=xfce4-nvgpugraph-plugin
_pkgname=xfce4-nvgpugraph-plugin
pkgver=1.0.1
pkgrel=1
pkgdesc="nvidia GPU Graph plugin for the Xfce4 panel."
arch=('any')
url="https://github.com/mwyborski/${_pkgname}"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('xfce4-panel')
makedepends=('git' 'xfce4-dev-tools')
source=("$pkgname::git+https://github.com/mwyborski/xfce4-nvgpugraph-plugin.git")
md5sums=('SKIP')

package() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
  sudo make install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
