# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Co-Maintainer: Henry Kohli <henr-h@cks-the-pla.net>

pkgname=smartbg-git
pkgver=20120525
pkgrel=1
pkgdesc="A smart wallpaper setter for multi-head X displays"
arch=(any)
url="https://code.schnouki.net/schouki/smartbg/"
license=('custom:WTFPL')
depends=('pygtk' 'python2-xlib')
makedepends=('git')
source=("smartbg::git+https://code.schnouki.net/schnouki/smartbg.git")
md5sums=("SKIP")

pkgver() {
cd smartbg
git log -1 --format=%ci | grep -Eo "[0-9]{4}\-[0-9].\-[0-9]." | tr -d "\-[:space:]"
}

package() {
cd smartbg
install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING || return 1
install -Dm755 smartbg $pkgdir/usr/bin/smartbg
} 
