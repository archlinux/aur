# Maintainer: Marcn <alp dot marcn at gmail dot com>
pkgname=yabs
pkgver=1.2.6
_pkgvercomplete=${pkgver}-beta1
pkgrel=1
pkgdesc="Eine Kunden- und Rechnungsverwaltungs-Software"
arch=('any')
url="https://github.com/anti43/openyabs"
license=('GPL3')
depends=('java-environment')
makedepends=('unzip')
source=("https://github.com/anti43/openyabs/releases/download/release-01-16/Yabs-${_pkgvercomplete}-package.zip"
        "https://raw.githubusercontent.com/anti43/openyabs/master/src/mpv5/resources/images/icon2_128.png"
        "yabs"
        "yabs.desktop")
sha256sums=('dd32de4f11346942ab3f454653535958c24bef64ef474ff5e399e5dddbe50a7a'
            'c08369e8fc7cf2dae5da7a2b9c572f7de2ca1edc0fd2ab7c8fb66e5e91668696'
            '5b47b14ea6d3cee868e8171f20226f3999e3551d6bcef7673b3b64cd34e96473'
            '111f4dbd9ffeb9cea2604e572057969ae3a79d4db3a29e211c7498aab90040f2')

package() {
  # Install jar
  install -Dm644 Yabs-${_pkgvercomplete}-package/yabs.jar ${pkgdir}/opt/yabs/yabs.jar

  # Install start script
  install -Dm755 Yabs-${_pkgvercomplete}-package/yabs.sh ${pkgdir}/opt/yabs/yabs.sh

  # Install dirs
  install -dm755 ${pkgdir}/opt/yabs/languages
  install -dm755 ${pkgdir}/opt/yabs/lib
  install -dm755 ${pkgdir}/opt/yabs/plugins
  install -dm755 ${pkgdir}/opt/yabs/templates

  # Install libraries
  install -m644 Yabs-${_pkgvercomplete}-package/lib/* ${pkgdir}/opt/yabs/lib/

  # Install licenses
  install -dm644 ${pkgdir}/usr/share/licenses/yabs/
  install -m644 Yabs-${_pkgvercomplete}-package/license* ${pkgdir}/usr/share/licenses/yabs/

  # Install icon
  install -Dm644 icon2_128.png ${pkgdir}/usr/share/pixmaps/yabs.png

  # Install .desktop file
  install -Dm644 yabs.desktop ${pkgdir}/usr/share/applications/yabs.desktop

  # Install run script
  install -Dm755 yabs ${pkgdir}/usr/bin/yabs
}
