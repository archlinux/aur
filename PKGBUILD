## Contributor: Markus Maiwald <mail@maiwald.tk>
## Maintainer: zoe <chp321@gmail.com>

pkgname=squeak-image
pkgver=5.1
bid=16549
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Image file for squeak VM"
url="http://www.squeak.org"
license=('custom:MIT' 'custom:XEROX' 'APACHE')
depends=('squeak-vm')

source_x86_64=("http://ftp.squeak.org/${pkgver}/Squeak${pkgver}-${bid}-64bit/Squeak${pkgver}-${bid}-64bit.zip")
md5sums_x86_64=('391b6ea09fd686e3bdf0ef6f1d851de4')

source_i686=("http://ftp.squeak.org/${pkgver}/Squeak${pkgver}-${bid}-32bit/Squeak${pkgver}-${bid}-32bit.zip")
md5sums_i686=('43fd465af1e8e8cb2666a3708e72d848')

package() {
  mkdir -p ${pkgdir}/usr/lib/squeak
  
  if [ $CARCH = 'x86_64' ]
  then
     _arch='64bit'
  elif [ $CARCH = 'i686' ]
  then
     _arch='32bit'
  fi

  install -m644 Squeak${pkgver}-${bid}-${_arch}.image ${pkgdir}/usr/lib/squeak/Squeak${pkgver}-${bid}-${_arch}.image
  install -m644 Squeak${pkgver}-${bid}-${_arch}.changes ${pkgdir}/usr/lib/squeak/Squeak${pkgver}-${bid}-${_arch}.changes

  ln -s Squeak${pkgver}-${bid}-${_arch}.image ${pkgdir}/usr/lib/squeak/squeak.image
  ln -s Squeak${pkgver}-${bid}-${_arch}.changes ${pkgdir}/usr/lib/squeak/squeak.changes
}
