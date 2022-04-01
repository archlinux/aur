# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=giblib
pkgver=1.2.4
pkgrel=8
pkgdesc="A library that feh uses as a wrapper to imlib2"
arch=('x86_64')
url="http://freshmeat.net/projects/giblib/"
license=('MIT')
depends=('imlib2' 'libxext' 'freetype2')
source=("https://downloads.sourceforge.net/project/slackbuildsdirectlinks/giblib/giblib-$pkgver.tar.gz")
sha512sums=('4866df223e6d219a5c9a327874bcd67260c83fba8f99862222df41ef86fb31efa0172a777bf46c853ca380dc2a64bbd41bf4fd658fcb84a924cab4e0f525dcfd')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" docsdir=/usr/share/doc/giblib install

  # Install custom license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
