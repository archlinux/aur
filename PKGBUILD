# Maintainer: Dimitri Kaparis <kaparis.dimitri@gmail.com>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=qtodotxt
pkgver=1.7.0
pkgrel=1
pkgdesc="A cross-platform UI client for todo.txt files (see todotxt.com)."
arch=('any')
url="https://github.com/mNantern/QTodoTxt"
license=('GPL3')
depends=('python-pyside' 'python-pyqt5' 'python-dateutil')
provides=('qtodotxt')
conflicts=('qtodotxt-hg' 'qtodotxt-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mNantern/QTodoTxt/archive/v$pkgver.tar.gz")
md5sums=('912441b78988294c9df7717d5854f238')

package() {
  cd "$srcdir/QTodoTxt-$pkgver"
  install -Dm755 bin/qtodotxt $pkgdir/usr/share/qtodotxt/bin/qtodotxt
  cp -pr qtodotxt "$pkgdir/usr/share/qtodotxt/"
  install -Dm644 qtodotxt/ui/resources/qtodotxt.ico "${pkgdir}/usr/share/qtodotxt/artwork/icon/qTodo-512.png"
  install -Dm644 packaging/Debian/qtodotxt.desktop "${pkgdir}/usr/share/applications/qtodotxt.desktop"
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/qtodotxt/bin/qtodotxt $pkgdir/usr/bin/qtodotxt
}
