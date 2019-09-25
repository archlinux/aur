# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=5.0.3
pkgrel=1
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://www.joypixels.com/download'
arch=('any')
license=('custom')
depends=('fontconfig')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-android-${pkgver}.ttf::https://cdn.joypixels.com/arch-linux/font/${pkgver}/joypixels-android.ttf"
        '75-joypixels.conf'
        "license-free-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/license/free-license.pdf"
        "license-appendix-${pkgver}-${pkgrel}.pdf::https://cdn.joypixels.com/arch-linux/appendix/joypixels-license-appendix.pdf")
sha256sums=('622bdc17f828436167d0818d885093af374b8f327237b1cb301b97dc7f37b091'
            'a6d96bba6ec120adad118a57d1ba39ea64cb0c796c671894ddff1be4aa13be18'
            'c4a17634bfebd5c1b74d9a02a1d981f8fcf6b1737162696cad7bfab161d8dbb3'
            '05084e4ddbbb0c241bb0ff4e307853a9e6236fa1c617b7cba44af31b6bfc5e2d')

package() {
    install -Dm644 "joypixels-android-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/JoyPixels.ttf"
    install -Dm644 -t "${pkgdir}/etc/fonts/conf.avail" 75-joypixels.conf
    install -Dm644 "license-free-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.pdf"
}

# vim:set ts=4 sw=4 et:
