# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dot-editor
pkgver=1.1.4
pkgrel=2
pkgdesc="The application, among other things, act as a graphical interface for the popular graphviz package. More generally, it is able to display the output of any text-based program that produces graphic files as output."
arch=('i686' 'x86_64')
url="https://sites.google.com/site/doteditorhome/"
license=('')
depends=('qt5-base' 'libx11' 'libpng' 'harfbuzz' 'libgl' 'icu' 'libffi' 'graphite' 'graphviz')
makedepends=('bzip2' 'cmake')
options=('!emptydirs')
source=("https://github.com/TNick/dot-editor/archive/$pkgver.tar.gz")
md5sums=('e85f18dd5376fc1f54e933fa801d4650')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
