# Maintainer: Mahdi Mirzadeh <mahdi@mirzadeh.pro>

pkgname=tlauncher
pkgver=14
pkgrel=2
pkgdesc="TLauncher for Minecraft"
arch=('x86_64')
url="https://tlauncher.org/"
license=('custom')
depends=('java-runtime>=8')
provides=('tlauncher')
source=(
  "TLauncher.v${pkgver}.zip::https://dl2.tlauncher.org/f.php?f=files/TLauncher.v${pkgver}.zip"
  "tlauncher"
  "tlauncher.svg"
  "org.tlauncher.desktop"
  "LICENSE"
)
sha256sums=(
  '6671e93e5013576f5258383cf333a08cc994e54d5c176a5b3be648e9ca2e51d2'
  '785483009008bc39470d30c534244b9bdc9d979533617c4535db9c6cae756122'
  'e0d875777253320b2f3862d569d2663a490a80be90f549441253015f0a5057aa'
  '2d6f6ea8fe716cb12dce565f1d659568fa7183506e6f75a8545a1d211518e38c'
  '3140f4b1f18dd00c5007ec6dd90333edbc2a3671429f4879a7d851845fed1e63'
)

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    tlauncher

  install -Dm755 -t "${pkgdir}/usr/share/tlauncher" \
    TLauncher.jar

  install -Dm644 -t "${pkgdir}/usr/share/icons" \
    ./tlauncher.svg

  install -Dm644 -t "${pkgdir}/usr/share/applications" \
    ./org.tlauncher.desktop

  install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE" \
    ./LICENSE
}
