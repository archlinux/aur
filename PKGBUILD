# Maintainer: Dimitri Kaparis <kaparis.dimitri@gmail.com>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=qtodotxt
pkgver=1.4.0
pkgrel=2
pkgdesc="A cross-platform UI client for todo.txt files (see todotxt.com)."
arch=('any')
url="https://github.com/mNantern/QTodoTxt"
license=('GPL3')
depends=('python-pyside')
provides=('qtodotxt')
conflicts=('qtodotxt-hg' 'qtodotxt-git')
install=$pkgname.install
source=("https://github.com/mNantern/QTodoTxt/archive/$pkgver.tar.gz")
md5sums=('9674a176578cfdaa864e43777023a269')

package() {
  cd "$srcdir/QTodoTxt-$pkgver"
  install -Dm755 bin/qtodotxt $pkgdir/usr/share/qtodotxt/bin/qtodotxt
  cp -pr qtodotxt "$pkgdir/usr/share/qtodotxt/"
  install -Dm644 artwork/icon/qTodo-512.png "${pkgdir}/usr/share/qtodotxt/artwork/icon/icon512.png"
  install -Dm644 packaging/Debian/qtodotxt.desktop "${pkgdir}/usr/share/applications/qtodotxt.desktop"
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/qtodotxt/bin/qtodotxt $pkgdir/usr/bin/qtodotxt
}

# vim:set ts=2 sw=2 et:
