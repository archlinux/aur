# Maintainer: Aaron Blasko <blaskoazzolaaaron@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=ttf-joypixels
pkgver=10.0.0
pkgrel=2
pkgdesc='Emoji as a Service (formerly EmojiOne)'
url='https://joypixels.com/'
arch=('any')
license=('custom')
provides=('emoji-font')
conflicts=('ttf-emojione')
replaces=('ttf-emojione')
install="${pkgname}.install"
source=("joypixels-linux-${pkgver}.ttf::https://cdn.joypixels.com/distributions/arch-linux/10.0.0/joypixels-android.ttf"
        "license-free-${pkgver}-${pkgrel}.txt::https://cdn.joypixels.com/distributions/arch-linux/10.0.0/free-license.txt"
        "license-appendix-${pkgver}-${pkgrel}.txt::https://cdn.joypixels.com/distributions/arch-linux/10.0.0/joypixels-license-appendix.txt")
sha256sums=('4f8bc13d37570f19c3ef69fe5ca7867b22a89951b6d944d194eca6a1bcea1efe'
            'd139dd7450b0ca5be631cddde3d6059197219366e6f5adea1d863d4ae6fb6b45'
            '8e005ae09e09dd59bca0a9064ecca091d50740f6f98f194f260ec69e9aae0348')

package() {
    install -Dm644 "joypixels-linux-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname#ttf-}/JoyPixels.ttf"

    echo "Please read and accept the terms of the license installed with the package."
    install -Dm644 "license-free-${pkgver}-${pkgrel}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 "license-appendix-${pkgver}-${pkgrel}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.appendix.txt"

}

# vim:set ts=4 sw=4 et:
