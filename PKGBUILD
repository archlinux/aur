# Maintainer: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=sane-qt-git
pkgver=r13.b1ffc54
pkgrel=1
pkgdesc="Simple scanner GUI (sane) made with PyQt4"
arch=('any')
url="https://github.com/sigmaSd/Sane-qt"
license=('MIT')
depends=('sane' 'python' 'python-pyqt4')
makedepends=('git')
source=("$pkgname::git://github.com/sigmaSd/Sane-qt.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 run_script "$pkgdir/usr/bin/sane-qt"
  install -Dm 755 sane-qt_start.py "$pkgdir/usr/share/sane-qt/sane-qt_start.py"
  install -Dm 755 saneqt.py "$pkgdir/usr/share/sane-qt/saneqt.py"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
