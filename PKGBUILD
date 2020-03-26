# Maintainer: Uumas <u@uumas.fi>
# Contributors: Mornielome <stuff@lukasjacobs.de>, c0ldcat <firez199984@gmail.com>, KbanKiller
pkgname=marvin
pkgver=20.9.0
_pkgver=$(echo $pkgver | sed 's/.[0-9]$//g')
pkgrel=1
pkgdesc="Intuitive applications and API for chemical sketching, visualization and data exploration"
arch=('any')
url="http://www.chemaxon.com"
license=('proprietary')
depends=('java-runtime<=11')
filename="marvin_linux_${_pkgver}.rpm"
source=("https://dl.chemaxon.com/marvin/$pkgver/$filename"
"MarvinSketch.desktop"
"MarvinView.desktop"
"marvin-sketch-symbolic.svg")
md5sums=('3f5780d7bbd24e1c4cb7a699facc0453'
         '54cb1a06e79c0e1cd980490247486df2'
         'cb6c8c35cd486844a465d408861642c0'
         'e6758f94b843b97804112fa0420ba1bb')

package() {
install -Dm755 MarvinSketch.desktop ${pkgdir}/usr/share/applications/MarvinSketch.desktop
install -Dm755 MarvinView.desktop ${pkgdir}/usr/share/applications/MarvinView.desktop

cp -R opt ${pkgdir}/opt

install -Dm644 opt/chemaxon/marvinsuite/.install4j/MarvinSketch.png ${pkgdir}/usr/share/pixmaps/marvin-sketch.png
install -Dm644 marvin-sketch-symbolic.svg ${pkgdir}/usr/share/pixmaps/marvin-sketch-symbolic.svg
}
