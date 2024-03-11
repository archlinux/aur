# Maintainer:          Kritias    <theodoridisgr@gmail.com>
# Previous Maintainer: jerry73204 <jerry73204@gmail.com>
# Previous maintainer: spider-mario <spidermario@free.fr>
pkgname=csmith
pkgver=2.3.0
pkgrel=3
pkgdesc='Tool for stress-testing compilers, static analyzers, and other tools that process C code'
arch=('i686' 'x86_64')
url='http://embed.cs.utah.edu/csmith/'
license=('custom:BSD')
depends=('perl')
source=("https://github.com/csmith-project/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d024a6b202f6a1b9e01351218a85888c06b67b837fe4c6f8ef5bd522fae098c')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install --directory "${pkgdir}/usr/share/licenses/${pkgname}/"
  install COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
