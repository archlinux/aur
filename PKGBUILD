pkgname=groovesquid
pkgver=0.9.3
pkgrel=0
pkgdesc="Find, play & download any song in the internet with one click"
arch=('any')
url="http://groovesquid.com/"
license=("GPL")
depends=('java-runtime')
source=("https://github.com/groovesquid/groovesquid/releases/download/v${pkgver}/Groovesquid.jar" "http://groovesquid.com/img/squid.png" "groovesquid.desktop" )
md5sums=('9ef0f331040391f2b8dcfed7f32ca7af' '725d5638a52ead6d31d57639457189e7' '860f8b8cf1eeee1b8f7b71a7fb505619')
noextract=('Groovesquid.jar')
_downloadedname=('Groovesquid.jar')

package() {
  echo $srcdir
  cd $srcdir
  mv $_downloadedname $pkgname.jar

  # make folders
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"

  # cp binary
  cp $pkgname.jar "${pkgdir}/opt/${pkgname}"

  # cp .desktop file and icon
  cp $pkgname.desktop "${pkgdir}/usr/share/applications"
  cp squid.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
