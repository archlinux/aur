# Maintainer: Vladislav Tyulbashev <vtyulb@vtyulb.ru>

pkgname='ricoh-sp150-ppd'
pkgver='v1.0.22'
pkgrel=1

pkgdesc="CUPS driver for Ricoh SP150 series"
arch=('x86_64')
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp150/sp150.htm"
license=('unknown')

depends=('cups' 'jbigkit' 'imagemagick' 'ghostscript')
builddepends=('binutils' 'p7zip')
optdepends=('inotify-tools: asynchronous printing support')

source=(http://support.ricoh.com/bb/pub_e/dr_ut_e/0001294/0001294700/V10_22/r75386L2.exe)
# mirror at https://ftp.vtyulb.ru/r75386L2.exe
# direct ppd file at https://ftp.vtyulb.ru/RICOH_SP_150.ppd.gz
md5sums=('99d3a64dc492a238305676d9cf7efd44')

build() {
  ar x RICOH-SP-150_1.0-22_amd64.deb
  tar -xf data.tar.gz
  rm -rf usr/share/doc
}

package() {
  mv opt $pkgdir/
  mv usr $pkgdir/
}
