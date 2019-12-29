# Maintainer: ZVVUbuntu
_pkgname=zvvonlinetv
pkgtest=test
pkgname=${_pkgname}-$pkgtest
pkgver=5.2
pkgrel=2
pkgdesc="TV | IPTV | youtube player(testing)"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5' 'mpv' 'qt5-multimedia' 'ffmpeg' 'youtube-dl') 
conflicts=('zvvonlinetv')
source=("${pkgname}_${pkgver}.deb::https://docs.google.com/uc?id=17lWM4Kmg-xS4I31ygl16tKo3Y1TdcSwg")
md5sums=('5a543ce9294aa6d2c3b77450b573a4e4')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  chmod -R 755 "${pkgdir}"/usr
  chmod -R 775 "${pkgdir}"/usr/share/${_pkgname}
  chmod -R 775 "${pkgdir}"/usr/share/${_pkgname}/modules/
  
  ######################################################
  #install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  #install -Dm755 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
