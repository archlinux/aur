# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
pkgver=1.9.3
pkgrel=1
pkgdesc='FancyZones-style window tiling for KDE Plasma (binary)'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-shadertools'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'kglobalaccel'
    'knotifications'
    'kcolorscheme'
    'layer-shell-qt'
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
provides=('plasmazones')
conflicts=('plasmazones' 'plasmazones-git')
source=("$pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/plasmazones-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('bdf74abb77c88aa597ad8e329d38b6f017230197425221b7b010a32c8216d603')
install=plasmazones.install

package() {
    bsdtar -xf "$srcdir/$pkgname-$pkgver.pkg.tar.zst" -C "$pkgdir"
    rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO" "$pkgdir/.INSTALL"
}
