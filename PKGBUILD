# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=volctl2
pkgver=2.3
pkgrel=1
pkgdesc="A volume control daemon."
arch=('any')
url="https://github.com/hobarrera/volctl2"
license=('BSD')
depends=('python2-notify' 'pygtk' 'python2-xlib' 'python2-pyalsaaudio' 'python2-xdg')
makedepends=('python2')
source=("https://github.com/hobarrera/$pkgname/archive/v${pkgver}.zip")
md5sums=('da464c8c3e67dc35aaef553e60d27c64')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 volctld.service "$pkgdir/usr/share/systemd/user/volctld.service"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
