# Maintainer: rafaqzsu <rafaqzsu [at] gmail (dot) com>
pkgname=cropgui-git
pkgver=349125
pkgrel=1
epoch=1
pkgdesc="A GTK GUI for lossless JPEG cropping (and rotating)"
arch=('any')
url="https://emergent.unpythonic.net/01248401946"
license=('GPL')
depends=('python'
         'python2-pillow')
makedepends=('git')
provides=('cropgui')
conflicts=('cropgui')
source=("$pkgname::git+https://github.com/jepler/cropgui")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  ./install.sh -f gtk -t $pkgdir -p /usr -P python2
}
