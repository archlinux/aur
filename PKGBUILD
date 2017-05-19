# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=wily
pkgver=0.13.42
pkgrel=1
pkgdesc="A mouse-oriented, text-based environment for programmers."
arch=('x86_64' 'i686')
url="https://wily.sourceforge.io"
license=('custom:Artistic')
depends=('libxt')
#makedepends=('')
provides=("${pkgname}")
source=("https://downloads.sourceforge.net/project/${pkgname}/baseline/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5f5498b11c28c8d1fde7750f133a4ab2faca4b23f2ca0a563103ea34e667c4cb')

build() {
  cd ${pkgname}-${pkgver}
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -D -m644 "Artistic" "${pkgdir}/usr/share/licenses/${pkgname}/Artistic"
  install -D -m755 "wily/wily" "${pkgdir}/usr/bin/wily"
}

# vim:set ts=2 sw=2 et:
