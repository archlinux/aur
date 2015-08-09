# Maintainer: Edsger de Looff <edsger@postbo.de>

pkgname=idera-hotcopy
pkgver=5.8.2
pkgrel=1
pkgdesc="Utility that creates a point-in-time snapshot of any linux block device"
arch=('x86_64' 'i686')
url="http://www.r1soft.com/free-tool-linux-hot-copy"
license=('Freeware')
depends=('linux-headers')
makedepend=('unzip' 'ar')
install='idera-hotcopy.install'
source=("http://repo.r1soft.com/release/trials/Idera-hotcopy.zip")
noextract=('Idera-hotcopy.zip')
md5sums=('8dd3ad1104124c50b43e389098b86ee7')

build () {
  cd $srcdir
  unzip Idera-hotcopy.zip

  if [ "${CARCH}" = "i686" ] ; then
    ar x $pkgname-i386-$pkgver.deb
  else
    ar x $pkgname-amd64-$pkgver.deb
  fi
  }

package() {
  tar -zxf data.tar.gz -C "${pkgdir}"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
