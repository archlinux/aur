_pkgname=mars-sim
pkgname=mars-sim-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="open source Java project aiming at building computer models that characterize operational and relational aspects of establishing human settlements on Mars"
arch=('x86_64')
url="https://mars-sim.github.io/"
license=('GPL3')
depends=('java-runtime')
makedepends=()
noextract=()
source=("$_pkgname.desktop"
        "https://github.com/mars-sim/mars-sim/releases/download/v${pkgver}/${pkgver}_swing_java17.jar"
)
md5sums=('887b7815923f92c4720b2f7020532e9e'
         '92df8092a4f80a8b8c5f50dac71eae0b')

package() {
  # install files
  cp -r $srcdir $pkgdir/opt

  # install /usr/bin binary
  install -D -m755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname

  # install desktop entry
  install -D -m644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}
