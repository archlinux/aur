# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=zrandr
pkgver=0.1
pkgrel=1
pkgdesc="A PyQt front end for xrandr"
arch=('any')
url="https://github.com/fralonra/zrandr"
license=('GPL')
depends=('xorg-xrandr' 'python' 'python-pyqt4')
source=("https://github.com/fralonra/zrandr/archive/${pkgver}.tar.gz")
md5sums=('b37bc326887793bc64e42abc3550e97e')

package() {
  cd "$srcdir/$pkgname-$pkgver/zrandr"

  install -Dm644 zrandr.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 zrandr.py -t "$pkgdir/usr/share/zrandr/"
  install -Dm755 zrandr -t "$pkgdir/usr/bin/"

  for _i in 16 64 128 256; do
    install -Dm644 icons/zrandr-${_i}x${_i}.png \
    "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/zrandr.png"
  done

  for prog in zrandr; do
    install -Dm644 icons/${prog}.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$prog.svg"
  done
}
