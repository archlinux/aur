# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=d52
pkgver=3.3.6
_pkgver=336
pkgrel=1
pkgdesc="8051/8052 Disassembler (also for 8035, 8041, 8048 and Z80)"
arch=('i686' 'x86_64')
url="http://www.bipom.com/dis51.php"
license=('GPL2')
depends=(glibc)
source=("http://www.bipom.com/files/${pkgname}v${_pkgver}.zip")
sha1sums=('3f1c8f818b25d80bb9656da5e6048cbdacac13e3')

prepare() {
  cd "${srcdir}/${pkgname}v${_pkgver}"
  make clean winclean
}

build() {
  cd "${srcdir}/${pkgname}v${_pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}v${_pkgver}"

  install -Dm755 d52 "${pkgdir}/usr/bin/d52"
  install -Dm755 d48 "${pkgdir}/usr/bin/d48"
  install -Dm755 dz80 "${pkgdir}/usr/bin/dz80"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README *.html
}

# vim:set ts=2 sw=2 et:
