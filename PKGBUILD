# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=formiko-git
pkgver=1.4.3.r28.gf05640d
pkgrel=1
pkgdesc="reStructuredText editor and live previewer"
url="https://github.com/ondratu/formiko"
license=('BSD')
arch=('any')
depends=('gobject-introspection-runtime' 'gtk3' 'gtksourceview3' 'hicolor-icon-theme' 'python' 'python-docutils' 'python-gobject' 'webkit2gtk' 'gtkspell3')
optdepends=('python-recommonmark: for Common Mark support (MarkDown)')
makedepends=('git')
provides=('formiko')
conflicts=('formiko')
source=("git+https://github.com/ondratu/formiko.git")
sha256sums=('SKIP')
	    
pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+'|tr - .
}

package() {
  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
