# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=pdf2htmlex
pkgver=0.14.6
pkgrel=2
pkgdesc="Convert PDF to HTML without losing text or format"
arch=('i686' 'x86_64')
url="http://coolwanglu.github.com/pdf2htmlEX/"
license=('GPL3')
depends=('poppler' 'fontforge')
makedepends=('cmake' 'git')
optdepends=('ttfautohint: Provides automated hinting process for web fonts')
provides=('pdf2htmlex')
source=(https://github.com/coolwanglu/pdf2htmlEX/archive/v${pkgver}.tar.gz)
sha256sums=('320ac2e1c2ea4a2972970f52809d90073ee00a6c42ef6d9833fb48436222f0e5')


build() {
  cd "$srcdir/pdf2htmlEX-${pkgver}"

  cmake . \
  -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/pdf2htmlEX-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
