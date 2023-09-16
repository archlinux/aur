# Maintainer: Martin Thierer <thierer@web.de>

pkgname=cc1541
pkgver=4.1
pkgrel=1
pkgdesc='Tool for creating .d64 images with custom sector interleaving etc.'
arch=('x86_64')
url='https://bitbucket.org/PTV_Claus/cc1541/src/master/'
license=('custom')
makedepends=('asciidoc')
source=("https://bitbucket.org/PTV_Claus/cc1541/downloads/cc1541-${pkgver}.zip")
md5sums=('8dac83166d84b21cc241cd4e28af1dfe')

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
  install -D -m644 -t ${pkgdir}/usr/share/${pkgname}/ transwarp*.prg
}
