# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=formiko
pkgver=1.4.3
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' \
	 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")
sha256sums=('993e0dfdf9cba1a0c9d75da4926f7df9664823885c873f7f5bb4b5bd4e9a7711')

package() {
  cd $pkgname-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

