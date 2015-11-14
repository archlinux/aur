# Maintainer: Marcin Wieczorek marcin@marcin.co
pkgname=screenshooter
pkgver=5.30
pkgrel=3
pkgdesc="Take a screenshot and share it with your friends"
arch=('i686' 'x86_64')
url="http://screenshooter.net/"
license=('Freeware')
depends=(
	"qt5-x11extras"
)

source=("icon.png" "screenshooter.desktop")
source_i686=("http://screenshooter.net/screenshooter_5.30-i386.tar.gz")
source_x86_64=("http://screenshooter.net/screenshooter_5.30-amd64.tar.gz")

md5sums=('9f3d281a63a047b7c90272264916561c'
         '23ba3762ff952ae7ab695285c227297e')
md5sums_i686=('1e155d20e8285e879f90e6afe83ec20b')
md5sums_x86_64=('e7f5e726a4a4f13b57bc90f0ac90aaf3')

package() {
  cd $pkgname\_$pkgver-*
  install -D -m755 "ScreenShooter5"         "${pkgdir}/usr/bin/ScreenShooter5"

  cd "../"
  install -D -m644 "screenshooter.desktop" "${pkgdir}/usr/share/applications/screenshooter.desktop"
  install -D -m644 "icon.png"     "${pkgdir}/usr/share/pixmaps/screenshooter.png"
  
  ln -s /usr/share/applications/screenshooter.desktop $HOME/.config/autostart/screenshooter.desktop
}
