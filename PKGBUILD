# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Uses the precompiled Archlinux build asset from https://github.com/Bali10050/Lightly/releases

# basic info
pkgname="lightly-qt6-bin"
pkgver=0.5.12
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
  '117a67899fafc7e323c6566b3fbcfe622fd833496c7ebab1913fda02c78ae7d9'
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

# KF5/QT5 for backward compatibility
depends_kf5=(
    'kcmutils5'
    'frameworkintegration5'
    'kconfigwidgets5'
    'kiconthemes5'
    'kirigami2'
    'kwindowsystem5'
)

depends=("${depends_kf6[@]}" "${depends_kf5[@]}")

conflicts=(
  lightly-kf6
  lightly-qt
  lightly-qt6
)


package() (
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"
)
