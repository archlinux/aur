# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>
pkgname=gst-debug-viewer-git
_pkgname=gst-debug-viewer
pkgver=0.0.310.75c8605
pkgrel=1
pkgdesc="View and analyze GStreamer debug log files"
arch=('any')
url="http://cgit.freedesktop.org/~cymacs/gst-debug-viewer/"
license=('GPL')
depends=('python2' 'hicolor-icon-theme')
makedepends=('git')
install=$pkgname.install
source=('git://people.freedesktop.org/~cymacs/gst-debug-viewer')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  echo "0.0.$(git rev-list --count master).$(git rev-parse --short master)"
}

package() {
  cd "$srcdir/${pkgname%-*}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
