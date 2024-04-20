# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.24.2.76'
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
    "WhatsAppEmoji-$pkgver.ttf::$url/releases/download/2.24.2.76-1/WhatsAppEmoji.ttf"
    "75-whatsapp-emoji.conf"
)
sha512sums=(
    "b9741dd41fb9219f98e582b12a8020828f7b5e763eca79a013f5a14ca248f0391919ecde251cbd6c8d7c34e75fd865ea0dc206eb1f3a909af365d85348ccf6f8"
    "e9b9115a70488c407b60f52cfd850e64cd447d5ec314b8f116bcb1ab355e6fd15e3856f6bbdc7c5928ec763a56ff00be98c09d6d89c7ade44fc2e0fefc98a208"
)
package() {
    install -Dm644 "$srcdir/WhatsAppEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/whatsapp-emoji/whatsapp-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-whatsapp-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-whatsapp-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

