# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Uses the precompiled Archlinux build asset from https://github.com/Bali10050/Lightly/releases

# basic info
pkgname="lightly-qt6-bin"
pkgver=0.5.8
pkgrel=1
pkgdesc="Bali10050's fork of Lightly (A modern style for qt applications)"
url="https://github.com/Bali10050/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")

options=(!emptydirs !debug)

source=(
  "${url}/releases/download/v${pkgver}/lightly-${pkgver}-x86_64.pkg.zst"

)

sha256sums=(
  '02376fd27305ce0f0d895fed8b400542900ad24bfcedb8eae420d019279107f9'
)

# KF6/Qt6
depends_kf6=(
  'kdecoration'
  'qt6-declarative'
  'kcoreaddons'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
)

depends=("${depends_kf6[@]}")

conflicts=(
  lightly-kf6
  lightly-qt
  lightly-qt6
)


package() (
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"
)
