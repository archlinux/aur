# ---------------------------------------------------------------
# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Original contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Original Maintainer: Anders Lund <anders at alweb dot dk>
# ---------------------------------------------------------------
# Adopted temporarily by Bruno Rodriguez (brunorro) on 2013-06-20 
# - Just changed the pkgver, the source and the md5sums to make
#   it work. If you can make it better, adopt it !
# ---------------------------------------------------------------

pkgname=opencpn
pkgver=4.8.2
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64')
license=("GPL2")
depends=('wxgtk' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme')
makedepends=('cmake')
url="http://opencpn.org"
install=opencpn.install
source=("https://github.com/OpenCPN/OpenCPN/archive/v4.8.2.tar.gz")
sha1sums=('b655167f0a0a11c6fb4a78cd670e1fbabd9ad8f9')

build() {
  cd "OpenCPN-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUNDLE_GSHHS=CRUDE -DBUNDLE_TCDATA=ON -DBUNDLE_DOCS=ON
  make
}

package() {
  cd "OpenCPN-${pkgver}"
  make DESTDIR="$pkgdir" install
}
