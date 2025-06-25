# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.25.9.78'
pkgrel=2
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
    "WhatsAppEmoji-$pkgver-$pkgrel.ttf::$url/releases/download/$pkgver-$pkgrel/WhatsAppEmoji.ttf"
    "75-whatsapp-emoji.conf"
)
sha512sums=(
    "703de005880590195fac643bf8e7613b63f5fe0bde8b3478d9f10deb58c9dfb0c9bcdc4306ef1ce74315c3f2148a5eca6324650e274cc5ddb5dd61c3b9fbe99d"
    "e9b9115a70488c407b60f52cfd850e64cd447d5ec314b8f116bcb1ab355e6fd15e3856f6bbdc7c5928ec763a56ff00be98c09d6d89c7ade44fc2e0fefc98a208"
)
package() {
    install -Dm644 "$srcdir/WhatsAppEmoji-$pkgver-$pkgrel.ttf" \
      "${pkgdir}/usr/share/fonts/whatsapp-emoji/whatsapp-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-whatsapp-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-whatsapp-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

