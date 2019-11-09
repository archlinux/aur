# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=formiko
pkgver=1.4.0
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' \
	 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ondratu/formiko/archive/${pkgver}.tar.gz")
sha256sums=('cdf01210ce0303baa018e2abe8fdca8ac64599b0fe1bdb6bf3a163263ec8b21f')

package() {
  cd $pkgname-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

