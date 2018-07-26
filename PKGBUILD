# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=minecraft-shiginima
pkgver=4.100
pkgrel=1
pkgdesc="ShiginimaSE Launcher - Sponge Edition"
url="http://teamshiginima.com/"
arch=('x86_64' 'i686')
license=('Custom')
depends=('java-runtime>=8')
source=("manual://ShiginimaSE_v${pkgver/./}.zip"
        "icon.png"
        "shiginima.desktop")
DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually. Please visit https://nofile.io/f/P33U2Bpm8tf/ShiginimaSE_v4100.zip')
sha256sums=('07a06b69903781949c6eec7e52e5a2c427158a31463f8d8ae37ab46e2519fb51'
            '533355f33a37bbc03ed866fa497e9aabf0c25caa83f867e85e9eee63b7e323d3'
            'c5e24af649103f323862f6cf9dc4ab2ebb9a0380462323159e8ac7453a91c4b9')

package() {
  cd "${srcdir}"
  install -D -m644 "`find . -name "*.jar"`" "${pkgdir}/opt/shiginima/shiginima.jar"
  install -D -m644 "shiginima.desktop" "${pkgdir}/usr/share/applications/shiginima.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/shiginima.png"
}
