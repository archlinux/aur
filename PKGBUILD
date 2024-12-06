# Maintainer: K4YT3X <aur@k4yt3x.com>
# Maintainer: TobFromme
pkgname=sdrtrunk-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR'
arch=('x86_64' 'aarch64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-x86_64-v${pkgver}.zip"
               "sdrtrunk.desktop")

source_aarch64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-aarch64-v${pkgver}.zip"
                "sdrtrunk.desktop")

b2sums_x86_64=('36a1b31b18ee14cc4df0472ff04fc199864e0d69f34f86908e8e0a35d57793f2c2388e214e9b6fa29237c9b8f18f04b96d908975da8e268a3c9503ff108a1455'
               '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

b2sums_aarch64=('7d67d4b5e77b649714335acdf74d76727a87ee899585c6b7038b712858ecbb779abce39ae0a25bf3d58425d2774d96572fc66f6f3009652abbb480fa31bc2cc8'
                '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
