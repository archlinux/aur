# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.25.1.75'
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
    "WhatsAppEmoji-$pkgver.ttf::$url/releases/download/$pkgver-$pkgrel/WhatsAppEmoji.ttf"
    "75-whatsapp-emoji.conf"
)
sha512sums=(
    "8cd8b2c72c86184c60b7cca4dd20f2283be4f2ffd51c8d934140f02ad12afab2a5d74594bff2cb871a13cb01d21fed6741bd6aaa31709fe63068fbac1d16bd9f"
    "e9b9115a70488c407b60f52cfd850e64cd447d5ec314b8f116bcb1ab355e6fd15e3856f6bbdc7c5928ec763a56ff00be98c09d6d89c7ade44fc2e0fefc98a208"
)
package() {
    install -Dm644 "$srcdir/WhatsAppEmoji-$pkgver.ttf" \
      "${pkgdir}/usr/share/fonts/whatsapp-emoji/whatsapp-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-whatsapp-emoji.conf"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-whatsapp-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

