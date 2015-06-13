# Maintainer: ant32 <antreimer@gmail.com>

pkgname=quasar-client
pkgver=2.2.1
pkgrel=2
pkgdesc="Business accounting software"
url="http://www.linuxcanada.com"
arch=('x86_64' 'i686')
license=('Commercial')
depends=('tcl' 'icu52' 'qt3')
optdepends=('polymer: KDE QT style Plastik')
[ ${arch} == 'i686' ] && _arch='i386' || _arch='amd64'
source_i686=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/i386-i586/Kubuntu-14.04/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/x86_64/Kubuntu-14.04/${pkgname}_${pkgver}-1_amd64.deb)
source=('Quasar.desktop')
md5sums=('5f4ced3487aa7c1d15f4277dc4323ea5')                                                                                                                                                                                                                                   
md5sums_x86_64=('0eb96ef652e89be2601aa91aecd3eca1')                                                                                                                                                                                                                            
md5sums_i686=('e202722ce4b7af9a47afcb85a9a51726')

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz
  cp -al opt "$pkgdir"
  install -Dm644 Quasar.desktop "$pkgdir/usr/share/applications/Quasar.desktop"
  install -Dm644 usr/share/doc/quasar-client/copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
