# Maintainer: Marcin Wieczorek marcin@marcin.co
pkgname=screenshooter
pkgver=5.30
pkgrel=1
pkgdesc="Take a screenshot and share it with your friends"
arch=('i686' 'x86_64')
url="http://screenshooter.net/"
license=('Freeware')
depends=(
	"qt5-x11extras"
)

source=("icon.png" "screenshooter.desktop")
source_i686=("http://kosz.marcin.co/dl/$pkgname-$pkgver-i686.tar.gz")
source_x86_64=("http://kosz.marcin.co/dl/$pkgname-$pkgver-x86_64.tar.gz")

md5sums=('9f3d281a63a047b7c90272264916561c'
         '23ba3762ff952ae7ab695285c227297e')
md5sums_i686=('4daba2a9c44574a02a05a5f207164b87')
md5sums_x86_64=('e83a03339f4d18775d3796a318c10087')

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 "ScreenShooter5"         "${pkgdir}/usr/bin/ScreenShooter5"

  cd "../"
  install -D -m644 "screenshooter.desktop" "${pkgdir}/usr/share/applications/screenshooter.desktop"
  install -D -m644 "icon.png"     "${pkgdir}/usr/share/pixmaps/screenshooter.png"
}
