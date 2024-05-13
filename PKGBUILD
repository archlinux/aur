# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.24.8.85'
pkgrel=1
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
install="$pkgname.install"
source=(
    "WhatsAppEmoji-$pkgver.ttf::$url/releases/download/2.24.8.85-1/WhatsAppEmoji.ttf"
    "75-whatsapp-emoji.conf"
)
sha512sums=(
    "6c631c59bc3659a2b8ab36b64b179b7fa77b4b55f2da80a01a9b3848930d8ef95296ca64cd8a5ba84e61c18efec4c2fe7bafd7928a2e302a7c03efd7e987c1a7"
    "e9b9115a70488c407b60f52cfd850e64cd447d5ec314b8f116bcb1ab355e6fd15e3856f6bbdc7c5928ec763a56ff00be98c09d6d89c7ade44fc2e0fefc98a208"
)
package() {
    install -Dm644 "$srcdir/WhatsAppEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/whatsapp-emoji/whatsapp-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-whatsapp-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-whatsapp-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

