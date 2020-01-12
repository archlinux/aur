# Contributor: Marcn <alp dot marcn at gmail dot com>

pkgname=yabs
pkgver=1.3.2
_filename="yabs-${pkgver}-linux-windows"
pkgrel=1
pkgdesc="software for handling customers, articles, quotes and billings"
arch=('any')
url="https://github.com/anti43/openyabs"
license=('GPL3')
depends=('java-environment')
makedepends=('unzip')
source=("https://github.com/anti43/openyabs/releases/download/release-${pkgver}/${_filename}.zip"
        "https://raw.githubusercontent.com/anti43/openyabs/master/src/mpv5/resources/images/icon2_128.png"
        "yabs"
        "yabs.desktop"
        "https://raw.githubusercontent.com/anti43/openyabs/release-${pkgver}/install/script/yabs.sh")
sha256sums=('b94e5acdf2206cb0f3652970e8d260bdb7a7d0efa3867e89eef306912697e5e5'
            'c08369e8fc7cf2dae5da7a2b9c572f7de2ca1edc0fd2ab7c8fb66e5e91668696'
            '5b47b14ea6d3cee868e8171f20226f3999e3551d6bcef7673b3b64cd34e96473'
            '111f4dbd9ffeb9cea2604e572057969ae3a79d4db3a29e211c7498aab90040f2'
            '9c6dbb78f2b8d98beb58be2dcdb3a3b5371e43fb66fb222e56329dc7e948fb68')

package() {
  # Install jar
  install -Dm644 ${srcdir}/yabs.jar ${pkgdir}/opt/yabs/yabs.jar

  # Install start script
  install -Dm755 ${srcdir}/yabs.sh ${pkgdir}/opt/yabs/yabs.sh

  # Install dirs
  install -dm755 ${pkgdir}/opt/yabs/languages
  install -dm755 ${pkgdir}/opt/yabs/lib
  install -dm755 ${pkgdir}/opt/yabs/plugins
  install -dm755 ${pkgdir}/opt/yabs/templates

  # Install libraries
  install -m644 ${srcdir}/lib/* ${pkgdir}/opt/yabs/lib/

  # Install licenses
  #install -dm644 ${pkgdir}/usr/share/licenses/yabs/
  #install -m644 ${srcdir}/license* ${pkgdir}/usr/share/licenses/yabs/

  # Install icon
  install -Dm644 icon2_128.png ${pkgdir}/usr/share/pixmaps/yabs.png

  # Install .desktop file
  install -Dm644 yabs.desktop ${pkgdir}/usr/share/applications/yabs.desktop

  # Install run script
  install -Dm755 yabs ${pkgdir}/usr/bin/yabs
}
