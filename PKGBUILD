# Maintainer: K4YT3X <aur@k4yt3x.com>
# Maintainer: TobFromme
pkgname=sdrtrunk-bin
pkgver=0.6.0
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

b2sums_x86_64=('c5094d3d46f56e188ed9a3e21a2445ff12cc8a7afa439f386d4b717b80f058e299d4e2db028a02abb8a3226cd2623bc80e12e9d46670a15609b22658de1823f1'
               '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

b2sums_aarch64=('e6a8188b3a35331849cef6ad42947099918a47ad8a2b5f78cc326f5beb4e95f891ce92b5db8d6f44ea89ac8ee3c6637c0522e4a0465a6412edd450f72232203a'
                '8e5ae51bf3acf88582913d8c1c120ce2ecc5082d0f74abe6f4cfeefc9222b1507ce18de089e5d7fd64f2cf80ce98be95cdc64629f5ebc2aaa1bbb34e9d9bf306')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
