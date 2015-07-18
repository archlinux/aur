# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=pololu-maestro
pkgver=150116
_fileid=0J315
pkgrel=1
pkgdesc="Pololu Maestro Control Center"
arch=(i686 x86_64)
url="http://www.pololu.com/docs/0J40/3.b"
license=('unknown')
depends=('mono')

source=("maestro_linux_${pkgver}.tar.gz::http://www.pololu.com/file/download/maestro_linux_${pkgver}.tar.gz?file_id=${_fileid}"
        "UscCmd"
        "MaestroControlCenter")

md5sums=('84feed740c0695bb0eea13ccf7988b97'
         'e665487da271355e5d7a1c61701927bc'
         '1ac31c86f9d968fd72d54fb01936664e')

package() {
  cd "$srcdir/maestro-linux"

  install -D "99-pololu.rules" "${pkgdir}/etc/udev/rules.d/99-pololu.rules"
  rm "99-pololu.rules"
  
  install -d "${pkgdir}/usr/lib/maestro_linux/"
  install -t "${pkgdir}/usr/lib/maestro_linux/" *

  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" "${srcdir}/UscCmd"
  install -t "${pkgdir}/usr/bin" "${srcdir}/MaestroControlCenter"
}

# vim:set ts=2 sw=2 et:
