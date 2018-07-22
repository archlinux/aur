# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=formiko-git
pkgver=1.3.0.1.g2bc545c
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
makedepends=('git')
source=("git+https://github.com/ondratu/formiko.git")
sha256sums=('SKIP')
	    
pkgver() {
  cd ${pkgname%-git}
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'|sed 's+2.2.2+3.0.0+'
}

package() {
  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
