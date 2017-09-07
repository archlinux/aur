# Maintainer: jerry73204 <jerry73204@gmail.com>
# Previous maintainer: spider-mario <spidermario@free.fr>
pkgname=csmith
pkgver=2.3.0
pkgrel=2
pkgdesc='Tool for stress-testing compilers, static analyzers, and other tools that process C code'
arch=('i686' 'x86_64')
url='http://embed.cs.utah.edu/csmith/'
license=('custom:BSD')
depends=('perl')
source=("https://embed.cs.utah.edu/csmith/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f247cc0aede5f8a0746271b40a5092b5b5a2d034e5e8f7a836c879dde3fb65d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install --directory "${pkgdir}/usr/share/licenses/${pkgname}/"
  install COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
