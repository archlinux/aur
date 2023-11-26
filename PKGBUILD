# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.23.2.72'
pkgrel=3
pkgdesc='TrueType WhatsApp emoji'
arch=('any')
url='https://github.com/dmlls/whatsapp-emoji-linux'
license=('unknown')
depends=()
provides=(emoji-font)
conflicts=(
    'noto-fonts-emoji'
    'ttf-symbola'
    'ttf-joypixels'
    'ttf-twemoji-color'
    'ttf-apple-emoji'
)

source=(
    "WhatsAppEmoji.ttf::$url/releases/download/2.23.2.72-1/WhatsAppEmoji.ttf"
    "66-whatsapp-emoji.conf"
)

sha512sums=(
    "9e484f5644c9c0acc70688fda7616c6e58f8023e8136990e7b39a2af72ae0b37ab1eb115826715ac12706d346b1662e83093d4e85d8851c78b5b09d972bc737f"
    "e34f2c1c15b816034f29cc47af470d83e61ad910394bb4463e0e9b6fbcba3f2afef22fd2b58da3abe67c70227aade26d26bb68f19f0761cb4ae01e1d1d42c09c"
)

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 WhatsAppEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"

    # Install fontconfig files
    install -Dm 644 66-whatsapp-emoji.conf -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/66-whatsapp-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

