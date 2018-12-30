# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=tomate
pkgname=python-$_pkgname
pkgver=0.9.0
pkgrel=1
pkgdesc="A pomodoro timer"
arch=('any')
url="https://github.com/eliostvs/tomate/"
license=('GPL')
depends=('glib2'
		 'python-blinker'
		 'python-dbus'
		 'python-gobject'
		 'python-venusian'
		 'python-wiring'
		 'python-wrapt'
		 'python-xdg'
		 'python-yapsy'
		 'python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('0a31688b17e9d1bb22e8dcc72cc8acb5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
