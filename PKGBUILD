# Maintainer: K4YT3X <aur@k4yt3x.com>
# Maintainer: TobFromme
pkgname=sdrtrunk-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-x86_64-v${pkgver}.zip"
               "sdrtrunk.desktop")

source_aarch64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-aarch64-v${pkgver}.zip"
                "sdrtrunk.desktop")

b2sums_x86_64=('4c07b9d3772f80babb8b7f174499f8ad5388f097cda0c693c1fd31b73d2d7e9d6f0a5e4d9e3d53f713af915de8093be7746a644e12b587ad271efe22a031fce4'
               '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

b2sums_aarch64=('39280dabaaacbe8130135a37d85c0805ef7bc5fa4d751023d47b706a2209e2e6a7299eb35a10de52cd8ce0b496d251fe8038123b8c96949897714350d395631d'
                '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
