# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>

pkgname="xss"
pkgver=1.0
pkgrel=2
pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('x86_64' 'i686')
url="https://github.com/9wm/${pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'libx11' 'libxss')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1791ab3f75279d264c3711b32db00535218f361213d6bc6ab428030524cf13fb')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -d "${pkgdir}/usr/bin"
  make BINDIR="${pkgdir}/usr/bin/" install

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
