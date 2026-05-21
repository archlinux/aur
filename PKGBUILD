# Maintainer: chung <me@chungn.com>
# Maintainer: Jay Chu <tothesong at gmail dot com>

pkgname=sunshine-bin
_pkgname=${pkgname%-bin}
pkgver=2026.516.143833
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight."
url="https://app.lizardbyte.dev"
source=(
    "$_pkgname-$pkgver-1-x86_64.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine-$pkgver-1-x86_64.pkg.tar.zst"
)
arch=('x86_64')
license=('GPL-3.0-only')
install=sunshine.install
depends=(
    'avahi'
    'curl'
    'libayatana-appindicator'
    'libcap'
    'libdrm'
    'libevdev'
    'libpipewire'
    'miniupnpc'
    'libmfx'
    'libnotify'
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
b2sums=('86bc061bfdab533987a1d32faa02ca275364915cc7eebb54e0ab4ddee19c1b9de980e5c7b4a0bfbd0ef5b0a6bf509f25f9525bf214881ce4dd45da6ec6c0f778')

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
