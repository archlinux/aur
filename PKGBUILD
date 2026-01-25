# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname='ttf-whatsapp-emoji'
pkgver='2.25.9.78'
pkgrel=3
pkgdesc='TrueType WhatsApp emoji'
arch=('any')
url='https://github.com/dmlls/whatsapp-emoji-linux'
license=('unknown')
depends=()
provides=(emoji-font)
install="${pkgname}.install"
install="$pkgname.install"
source=(
    "WhatsAppEmoji-$pkgver-$pkgrel.ttf::$url/releases/download/$pkgver-$pkgrel/WhatsAppEmoji.ttf"
    "75-whatsapp-emoji.conf"
)
sha512sums=(
    "307c7bd082fbc46e85c079618360baef7f3698608709ff50df60c1967a8d4979a253f9ae09c9144b25fdbc7c2e5d359f470564ac672c869dd2ad45b8fa24051a"
    "e9b9115a70488c407b60f52cfd850e64cd447d5ec314b8f116bcb1ab355e6fd15e3856f6bbdc7c5928ec763a56ff00be98c09d6d89c7ade44fc2e0fefc98a208"
)
package() {
    install -Dm644 "$srcdir/WhatsAppEmoji-$pkgver-$pkgrel.ttf" \
      "${pkgdir}/usr/share/fonts/whatsapp-emoji/whatsapp-emoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/75-whatsapp-emoji.conf"
}
