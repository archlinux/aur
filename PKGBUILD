# Maintainer: sh0 <mee@sh0.org>

pkgname=comgt
pkgver=0.32
pkgrel=3
pkgdesc='Linux UMTS/GPRS command-line tool'
arch=('i686' 'x86_64')
url='http://comgt.sf.net/'
license=('GPL2')
depends=('pygtk' 'hsolink')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}.${pkgver}.tgz")
md5sums=('db2452680c3d953631299e331daf49ef')

build() {
  cd "${srcdir}/${pkgname}.${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}.${pkgver}"

  install -D -m0755 comgt ${pkgdir}/usr/bin/comgt
  install -D -m0644 comgt.1 ${pkgdir}/usr/share/man/man1/comgt.1
  install -D -m0644 sigmon.1 ${pkgdir}/usr/share/man/man1/sigmon.1

  install -D -m0644 scripts/README ${pkgdir}/etc/comgt/README
  install -D -m0755 scripts/command ${pkgdir}/etc/comgt/command
  install -D -m0755 scripts/dump ${pkgdir}/etc/comgt/dump
  install -D -m0755 scripts/operator ${pkgdir}/etc/comgt/operator
  install -D -m0755 scripts/sigmon ${pkgdir}/etc/comgt/sigmon
}
