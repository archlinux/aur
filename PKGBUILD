# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=formiko
pkgver=1.3.0
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")

package() {
  cd $pkgname-$pkgver
  
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('e72f469fd04d2a8111abd0075ae0f0749a787e78a38cae0d7d0a5f5234c24459')
