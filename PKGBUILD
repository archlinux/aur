# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=2026.906.222525
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver-1-x86_64.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine-$pkgver-1-x86_64.pkg.tar.zst"
)
arch=('x86_64')
license=('GPL-3.0-only')
options=('!strip' '!debug')
install=sunshine.install
depends=(
    'avahi'
    'curl'
    'gcc-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libpipewire'
    'miniupnpc'
    'libmfx'
    'libpulse'
    'libva'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'numactl'
    'openssl'
    'opus'
    'qt6-base'
    'qt6-svg'
    'udev'
    'vulkan-icd-loader'
    'which'
)
optdepends=(
    'cuda: Nvidia GPU encoding support'
    'libva-mesa-driver: AMD GPU encoding support'
    'xorg-server-xvfb: Virtual X server for headless testing'
)
# makedepends=('patchelf')
conflicts=('sunshine')
provides=('sunshine')
b2sums=('b73ae29bf3e7763c5187b0ebfe2061a87764a79d699df9737ba7170a0a5954e961601afbccb7ccfb0140d561f60c3a7895049ec421c4f9f239267a46111e5b43')

# prepare() {
#     patchelf \
#     "usr/bin/sunshine"
#     --replace-needed libminiupnpc.so.{18,21} \
#     --replace-needed libicuuc.so.7{5,6} \
#     --replace-needed libboost_locale.so.1.8{3,6}.0 \
#     --replace-needed libboost_log.so.1.8{3,6}.0 \
#     --replace-needed libboost_filesystem.so.1.8{3,6}.0 \
#     --replace-needed libboost_program_options.so.1.8{3,6}.0 \
#     --replace-needed libboost_thread.so.1.8{3,6}.0 \
# }

package() {
    install -Dm755 "usr/bin/sunshine" "$pkgdir/usr/bin/sunshine"
    cp -r "usr/lib" "usr/share" "$pkgdir/usr"
}
