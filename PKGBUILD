_pkgname=mars-sim
pkgname=mars-sim-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="open source Java project aiming at building computer models that characterize operational and relational aspects of establishing human settlements on Mars"
arch=('x86_64')
url="https://mars-sim.github.io/"
license=('GPL3')
depends=('java-runtime-common')
noextract=("${pkgver}_swing_java17.jar")
source=("${_pkgname}.jar::https://github.com/mars-sim/mars-sim/releases/download/v${pkgver}/${pkgver}_swing_java17.jar"
	"$_pkgname.desktop" "${_pkgname}" "MSP_Logo.jpg")
sha256sums=('e222c160c329ea81a8a700891734993b558965daf803e4ad34f5cf90449b6652'
            '6ed327ffc390be878a785357101182a7e87db3bcc7bab6a81f8378db6f326b1d'
            '6acac0694a6c55501f906a592396c9d522149e864463811b95f10cacb6ca53aa'
            '934a9e4fc573de2016be4465d62c2b30485afcd8dd5b8b4b5b76d114fd4c5e33')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir/${_pkgname}.jar" "$pkgdir/usr/share/java/${_pkgname}.jar"
  install -m755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -m755 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -m755 "$srcdir/MSP_Logo.jpg" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
