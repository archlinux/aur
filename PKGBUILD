# Maintainer: Вячеслав Зубик

pkgname=zvvradio
_pkgname=ZVVRadio
pkgver=2.0
#_pkgver=2
pkgrel=2
pkgdesc="radio player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5' 'vlc') 
conflicts=("zvvradio-git")
source=("${_pkgname}_${pkgver}.deb::https://www.dropbox.com/s/ad7llycxk5km9ps/ZVVRadio2.deb?dl=0" "$pkgname" "Radio.desktop")
md5sums=('970583d63a06fed0d2ee8079a61a3e13'
         'dc95737680e936786d9e23eb7a9a1514'
         'eafda782b08cc9e7246a95d49ef04418')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 Radio.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
