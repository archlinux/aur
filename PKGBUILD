# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: tarball <bootctl@gmail.com>

pkgname=qstudio-bin
pkgver=4.08
pkgrel=1
pkgdesc='Free SQL Editor for Data Analysis'
arch=(any)
url='https://www.timestored.com/qstudio'
license=(custom) # Apache-licensed sources on GitHub cover a subset of the project
provides=(qstudio)
conflicts=(qstudio)
depends=('java-runtime')
noextract=("qstudio-$pkgver.jar")
source=(
  "qstudio-$pkgver.jar::https://github.com/timeseries/qstudio/releases/download/$pkgver/qstudio.jar"
  'qstudio.sh'
  'qstudio.desktop'
  'qstudio.png'
)
sha256sums=('50df4611c6238ee5df4cf2e5fa03402c2d746da227087580b3346ab61f9db567'
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
