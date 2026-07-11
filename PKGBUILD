# Maintainer: Mopigames <mopigames@proton.me>
pkgname=vanilla-wiiu-bin
pkgver=2026.07.10
pkgrel=1
pkgdesc="A work-in-progress Wii U GamePad software clone for Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vanilla-wiiu/vanilla"
license=('GPL-2.0-only')
depends=('glibc' 'glib2' 'polkit' 'libva' 'libnm' 'libx11' 'libdrm' 'libglvnd' 'zlib')
provides=('vanilla-wiiu')
conflicts=('vanilla-wiiu' 'vanilla-wiiu-git')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/continuous/vanilla-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/continuous/vanilla-linux-aarch64.tar.gz")
# The 'continuous' tag is rebuilt on every upstream commit, so checksums
# would break as soon as upstream pushes. Bump pkgver/pkgrel to track new builds.
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -dm755 "$pkgdir/usr"
    cp -a "$srcdir"/{bin,include,lib,share} "$pkgdir/usr/"
}
