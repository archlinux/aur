# Maintainer: dianlujitao <dianlujitao[at]gmail[dot]com>

_pkgname=jadx
pkgname=jadx-unstable-bin
pkgver=0.8.0.b589.0f27eba
_majorver=${pkgver:0:5}
_minorver=${pkgver:6:4}-${pkgver:11}
pkgrel=1
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files'
url='https://github.com/skylot/jadx'
arch=('any')
license=('Apache')
depends=('java-runtime' 'bash' 'fontconfig' 'xorg-font-utils')
provides=('jadx')
conflicts=('jadx')
source=("https://dl.bintray.com/skylot/jadx/jadx-${_majorver}-${_minorver}.zip")
sha256sums=('7bef61ce7c4d1d6d046770a296a12842654b26db1b00fa619b6c18c14bf94ccc')

package() {
  install -Dm 755 bin/{jadx,jadx-gui} -t "${pkgdir}/usr/share/java/${_pkgname}/bin"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${_pkgname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/java/${_pkgname}/bin/jadx "${pkgdir}/usr/bin/jadx"
  ln -s /usr/share/java/${_pkgname}/bin/jadx-gui "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm 644 NOTICE README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
