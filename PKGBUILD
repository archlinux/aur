# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
pkgname=qtshutdownmenu-git
pkgver=r3.c08b4f7
pkgrel=1
pkgdesc="Graphical shutdown util with PyQt5 and lock script for i3"
arch=('any')
url="https://github.com/z3ntu/qtshutdownmenu"
license=('MIT')
depends=('python' 'python-pyqt5' 'ttf-liberation' 'imagemagick' 'scrot' 'i3lock')
options=(!emptydirs)
source=(git+https://github.com/z3ntu/qtshutdownmenu)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/qtshutdownmenu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/qtshutdownmenu"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons"
  install -Dm755 "shutdownmenu.py" "$pkgdir/usr/bin/qtshutdownmenu"
  install -Dm755 "lock.sh" "$pkgdir/usr/bin/lock"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/lock.png"
}

