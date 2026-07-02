# Maintainer: Aaron Blasko <blaskoazzolaaaron@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=11.0.0
pkgrel=1
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://joypixels.com/'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-linux-${pkgver}.ttf::https://cdn.joypixels.com/distributions/arch-linux/11.0.0/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.txt::https://cdn.joypixels.com/distributions/arch-linux/11.0.0/free-license.txt"
        "license-appendix-${pkgver}-${pkgrel}.txt::https://cdn.joypixels.com/distributions/arch-linux/11.0.0/joypixels-license-appendix.txt")
sha256sums=('b5a1cacb6ae29f5484db804a9c1f0b67aeb653c30ef472f989fdfe987437f08a'
            '86ce929a40d7b1d05b0e183c64797cf13e6da504cabff1111b1ad2e26c0882ad'
            '8e005ae09e09dd59bca0a9064ecca091d50740f6f98f194f260ec69e9aae0348')

package() {
    install -Dm644 "joypixels-linux-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"

    echo "Please read and accept the terms of the license installed with the package."
    install -Dm644 "license-free-${pkgver}-${pkgrel}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.txt"

}

# vim:set ts=4 sw=4 et:
