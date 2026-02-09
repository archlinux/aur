# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
pkgver=1.8.0
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
sha256sums=('19b2d2664290ba187dcc62e28765591dab760484a49a59d46b2bd152bc8ac1ef')
install=plasmazones.install

package() {
    bsdtar -xf "$srcdir/$pkgname-$pkgver.pkg.tar.zst" -C "$pkgdir"
    rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO" "$pkgdir/.INSTALL"
}
