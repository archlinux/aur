# Maintainer: Slava Zubik

pkgname=zvvonlinemusic
pkgver=0.5
pkgrel=1
pkgdesc="Online music player"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('pyqt5-common' 'python-pyqt5' 'vlc') 

source=("${pkgname}_${pkgver}.deb::https://docs.google.com/uc?id=1qLZvDdBpMyinIWid36JPl7QuLyVfL-Gy"
"zvvonlinemusic" "ZVVOnlineMusic.desktop")
md5sums=('cedc98e0b73760bb97b3fa520ac628d5'
         'b5592fc7084d6bb600da38c3f432bb5c'
         '9426476aa2e7e10e45597917e3c750ec')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm755 zvvonlinemusic $pkgdir/usr/bin/zvvonlinemusic
  install -Dm755 ZVVOnlineMusic.desktop $pkgdir/usr/share/applications/ZVVOnlineMusic.desktop
}
