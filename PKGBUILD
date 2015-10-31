# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=tomate
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="A pomodoro timer"
arch=('any')
url="https://github.com/eliostvs/tomate/"
license=('GPL')
depends=('glib2'
		 'python-blinker'
		 'python-dbus'
		 'python-gobject'
		 'python-six'
		 'python-wiring'
		 'python-wrapt'
		 'python-xdg'
		 'python-yapsy'
		 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/tomate/archive/$pkgver.tar.gz")
md5sums=('3daec1366376bee4546b93feed183504')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
