# Maintainer: Dawood <Nurysso at proton.me>
pkgbase=tyr
pkgname=tyr-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Intelligent file organization powered by machine learning and simple algos"
arch=('x86_64' 'aarch64')
url="https://github.com/nurysso/tyr"
license=('GPL-3.0-or-later')
provides=('tyr')
conflicts=('tyr')
source_x86_64=(
  "tyr-linux-x86_64-${pkgver}::https://github.com/nurysso/tyr/releases/download/v${pkgver}/tyr-linux-x86_64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/nurysso/tyr/v${pkgver}/LICENSE"
)
source_aarch64=(
  "tyr-linux-aarch64-${pkgver}::https://github.com/nurysso/tyr/releases/download/v${pkgver}/tyr-linux-aarch64"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/nurysso/tyr/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '52edc3d823d715f2d72717aebbb1219ef95600fc1aeace1f633c1f794d2d4390'
  'a6ba33e31f75499478db550f25a8239328431ed1697c7bc613f26b84a6366f3f'
)
sha256sums_aarch64=(
  '45d9af7c4716f36db2ea991fa9a9daf86281d12a66de50174ee737f2568828cf'
  'a6ba33e31f75499478db550f25a8239328431ed1697c7bc613f26b84a6366f3f'
)

package() {
  # Install binary based on architecture
  case "$CARCH" in
    x86_64)
      install -Dm755 "$srcdir/tyr-linux-x86_64-${pkgver}" "$pkgdir/usr/bin/tyr"
      ;;
    aarch64)
      install -Dm755 "$srcdir/tyr-linux-aarch64-${pkgver}" "$pkgdir/usr/bin/tyr"
      ;;
  esac

  # Install license
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
