# Maintainer: KarmaTag
pkgname=sdrtrunk-git
pkgver=0.6.0_beta_2
pkgrel=1
_pkgfile=0.6.0_beta2
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR - Latest release'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-x86_64-v${_pkgfile//_/-}.zip"
               "sdrtrunk.desktop"
               "cat-radio-icon.png")

source_aarch64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-aarch64-v${_pkgfile//_/-}.zip"
                "sdrtrunk.desktop"
                "cat-radio-icon.png")

b2sums_aarch64=('2e36de979a4d7c80acb82dd5a702dc3ffc9ee82cfed21ed62cd697f9112f0a50255f157b0002950122b7eaa0f5f832ee6b7bbcf8c9b46323e2d231a237cadb12'
                'e226810773a27e6a61ba511381f7c2f4dfb6799adcebc9ef4fea587c4a077b5355899631173a659a95bee99a49d84a33059fabd006c82c0689f005f1e3af815d'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('62c663c9f8153d0fca0ec4dc9698dd400467a46d2a5cc81c9448cd55a8c3ce2c4675a5e0db66b41186e6ff57f60fdf242804e1b45f5110f30d83cb1c76b2717a'
               'e226810773a27e6a61ba511381f7c2f4dfb6799adcebc9ef4fea587c4a077b5355899631173a659a95bee99a49d84a33059fabd006c82c0689f005f1e3af815d'
               '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
