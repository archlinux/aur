# Maintainer: Coobyk <coobyk@github>
#
# Prebuilt version of gpu-screen-recorder-gpui. The tarball is built from the
# tagged source on Arch Linux by the `aur-build` job in
# .github/workflows/release.yml and attached to the GitHub release, so it always
# matches `pkgver`.

pkgname=gpu-screen-recorder-gpui-bin
pkgver=5.7.10
pkgrel=1
pkgdesc="GPUI (Rust) frontend for gpu-screen-recorder (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/gpu-screen-recorder-gpui"
license=('GPL-3.0-only')
depends=(
    'gpu-screen-recorder'
    'libglvnd'
    'vulkan-icd-loader'
    'wayland'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
    'libxau'
    'libxdmcp'
)
# Mutually exclusive with the source package.
provides=('gpu-screen-recorder-gpui')
conflicts=('gpu-screen-recorder-gpui')
source=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gpu-screen-recorder-gpui-$pkgver-x86_64-archlinux.tar.gz")
sha256sums=('5a0968651777f6593748448d4cd4c1aa43e9c92d4438d13895aefce69e7773dd')
# The binary was already stripped when the release tarball was built.
options=('!debug' '!strip')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
