# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
pkgver=2.8.8
pkgrel=1
pkgdesc='Window tiling and autotiling for KDE Plasma (binary)'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
license=('GPL-3.0-or-later')

# Exact KWin upstream version this binary was built against. The kwin-effect
# plugin's IID embeds KWin's exact upstream version string; KWin refuses to
# load effects whose IID doesn't match its own version, including across patch
# bumps (e.g. 6.6.4 -> 6.6.5). CI substitutes this value at release time from
# the build-host's installed kwin (see .github/workflows/release.yml).
_kwin_ver=6.6.5

depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-shadertools'
    'qt6-svg'
    'kconfig'
    'kconfigwidgets'
    'kirigami'
    'kcmutils'
    'kglobalaccel'
    'qt6-wayland'
    "kwin=${_kwin_ver}"
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
provides=('plasmazones')
conflicts=('plasmazones' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/plasmazones-$pkgver-linux-x86_64.tar.gz")
sha256sums=('SKIP')
install=plasmazones.install

package() {
    cp -a "$srcdir/plasmazones-linux-x86_64/usr" "$pkgdir/usr"
}
