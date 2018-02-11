pkgname=nvidia-bumblebee-applet
pkgver=1.0.0
pkgrel=1
pkgdesc="Applets for NVIDIA Bumblebee"
arch=('any')
url="https://github.com/muhammadsayuti/nvidia-bumblebee-applet"
license=('GPLv2')
depends=('python2' 'python2-gobject' 'python2-libappindicator')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muhammadsayuti/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('aa6b118a8472eb9027094c5d1fd905f2')

package(){
  cd ${pkgdir}
  echo ${pkgdir}
  mkdir -p usr/share/icons
  mkdir -p etc/xdg/autostart
  mkdir -p usr/lib

  cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver}/icons/*.svg usr/share/icons/
  cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver}/icons/nvidia-bumblebee.png usr/share/icons/

  cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver}/etc/xdg/autostart/nvidia-bumblebee.desktop etc/xdg/autostart/

  cd usr/lib
  cp -dpr --no-preserve=ownership ${srcdir} ${pkgname}
  echo "Removing .git files"
  cd ${pkgname}
  rm -f .gitignore
  echo "Removing dev files"
  rm -f README.md
}