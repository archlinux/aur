# Maintainer: LightDot <lightdot -a-t- server.si>
# Contributor: tarball <bootctl@gmail.com>

pkgname=qstudio-bin
pkgver=5.01
pkgrel=1
pkgdesc='Free SQL Editor for Data Analysis'
arch=('any')
url='https://www.timestored.com/qstudio'
license=('Apache-2.0') # fully open source since 2024-11-18
provides=('qstudio')
conflicts=('qstudio')
depends=('java-runtime')
noextract=('qstudio-$pkgver.jar')
source=(
  "qstudio-$pkgver.jar::https://github.com/timeseries/qstudio/releases/download/$pkgver/qstudio.jar"
  'qstudio.sh'
  'qstudio.desktop'
  'qstudio.png'
)
sha256sums=('86d0dd9bba334972957633db40ad83fab6702556fa87f806ba0d28ad3296ae62'
            'ba263d25a56fde59d0960cc7c116f175f1de31b02ba6b33d815419c403949e78'
            'b0bf670006e46258b86577ee2c5eb83b7bc4f9b18d7173334e1dbcd20265931e'
            '5d3f06e1a865244265c7c4e4d52c6f63318fa6405d03b232c64b13b72bf298b7')

package() {
  install -Dm644 "qstudio-$pkgver.jar" \
    "$pkgdir/usr/lib/qstudio/qstudio.jar"

  install -Dm755 qstudio.sh \
    "$pkgdir/usr/bin/qstudio"

  install -Dm644 qstudio.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/qstudio.png"

  install -Dm644 qstudio.desktop \
    "$pkgdir/usr/share/applications/qstudio.desktop"
}
