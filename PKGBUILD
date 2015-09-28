# Maintainer: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=qtodotxt
pkgver=1.4.0
pkgrel=1
pkgdesc="A cross-platform UI client for todo.txt files (see todotxt.com)."
arch=('any')
url="https://github.com/mNantern/QTodoTxt"
license=('GPL3')
depends=('python-pyside')
makedepends=('imagemagick')
optdepends=('todotxt: command line todo.txt')
provides=('qtodotxt')
conflicts=('qtodotxt-hg')
install=$pkgname.install
source=(
  'https://github.com/mNantern/QTodoTxt/archive/1.4.0.tar.gz'
  qtodotxt.desktop)
md5sums=('9674a176578cfdaa864e43777023a269'
         '56774bd2d9895a2f1ea4deee0c5fcf6c')

package() {
  cd "$srcdir/QTodoTxt-1.4.0"
  install -Dm755 bin/qtodotxt $pkgdir/usr/share/qtodotxt/bin/qtodotxt
  cp -pr qtodotxt "$pkgdir/usr/share/qtodotxt/"
  install -Dm644 artwork/icon/qTodo-512.png "${pkgdir}/usr/share/pixmaps/qtodotxt.png"
  install -Dm644 "$startdir/qtodotxt.desktop" "${pkgdir}/usr/share/applications/qtodotxt.desktop"
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/qtodotxt/bin/qtodotxt $pkgdir/usr/bin/qtodotxt
}

# vim:set ts=2 sw=2 et:
