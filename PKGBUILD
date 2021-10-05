# Maintainer: Martin Thierer <thierer@web.de>

pkgname=cc1541
pkgver=3.3
pkgrel=1
pkgdesc='Tool for creating .d64 images with custom sector interleaving etc.'
arch=('x86_64')
url='https://bitbucket.org/PTV_Claus/cc1541/src/master/'
license=('custom')
makedepends=('asciidoc')
source=("https://bitbucket.org/PTV_Claus/cc1541/downloads/cc1541-${pkgver}.tar.gz")
md5sums=('432c9159de7f85102b23c30af2d1efd1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make cc1541 man
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 -t ${pkgdir}/usr/bin/ cc1541
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README.md
  install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
  install -D -m644 -t ${pkgdir}/usr/share/man/man1/ cc1541.1
}
