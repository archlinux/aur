# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dot-editor
pkgver=1.1.2
pkgrel=2
pkgdesc="The application, among other things, act as a graphical interface for the popular graphviz package. More generally, it is able to display the output of any text-based program that produces graphic files as output."
arch=('i686' 'x86_64')
url="https://sites.google.com/site/doteditorhome/"
license=('')
depends=('qt5-base' 'libx11' 'libpng' 'harfbuzz' 'libgl' 'icu' 'libffi' 'graphite')
makedepends=('bzip2' 'cmake')
options=('!emptydirs')
source=("http://tnick.github.com/dot-editor/distrib/1.1.1/source/dot-editor-1.1.1-Source.tar.bz2")
md5sums=('b91bb9cab1d5aa68ce2c90c850ef9f6d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-Source
  cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-Source
  make install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
