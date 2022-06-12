# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>
_name=cups-of-caffeine
pkgname=caffeine
pkgver=2.9.11
pkgrel=1
pkgdesc="Keep your computer awake."
arch=(any)
url="https://launchpad.net/caffeine"
license=('GPL3')
depends=(python-xlib python-gobject python-ewmh)
makedepends=('python-setuptools')
optdepends=('libayatana-appindicator: caffeine-indicator (tray applet) support')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
md5sums=('cd624f6d0a573771ff74df122376fbf8')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py check
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  cd "$pkgdir"
  chmod -R +rx *
}
