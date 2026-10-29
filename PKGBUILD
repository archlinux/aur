# Maintainer: Ismaïl Bahloul <i.bahloul01@gmail.com>

# TuxMix — Open-source TotalMix replacement for RME audio interfaces on Linux
#
# The prebuilt binaries the release workflow (.github/workflows/release.yml)
# attaches to each GitHub release: no Rust toolchain, no build. The `tuxmix`
# package builds the same thing from source.
#
# When a new version is released, update pkgver and run updpkgsums.

pkgname=tuxmix-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Open-source TotalMix replacement for RME audio interfaces on Linux (prebuilt)"
arch=('x86_64')
url="https://github.com/ismail-bahloul/TuxMix"
license=('GPL-3.0-only')
depends=(
    'alsa-lib'
    'gcc-libs'
    'glibc'
    'libgl'
    'systemd-libs'
)
provides=("tuxmix=${pkgver}")
conflicts=('tuxmix')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/tuxmix-${pkgver}-x86_64.tar.gz")
sha256sums=('6c95c6aed78ff7f19d57cba485a1412defdf4ac4df63088d4c8bd31958e6d411')

package() {
    # The tarball is the installed tree (tools/release/package.sh).
    cp -a "${srcdir}/tuxmix-${pkgver}-x86_64/usr" "${pkgdir}/"
}
