# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
pkgver=1.15.14
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
sha256sums=('789b1e89564a9fd9a90dcd5425b0a9a3b876e63fd071775f7f638c5182ec9af2')
install=plasmazones.install

package() {
    bsdtar -xf "$srcdir/$pkgname-$pkgver.pkg.tar.zst" -C "$pkgdir"
    rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO" "$pkgdir/.INSTALL"
}
