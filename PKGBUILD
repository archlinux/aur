# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
#
# Note: This font is propietary. You need to purchase it from the official
# website, and place it in the same directory as this PKGBUILD for it to work.
# This PKGBUILD exists merely for tracking installed font files and running any
# relevant hooks during installation.

pkgname=otf-operator-mono
pkgver=1.200
pkgdesc="Operator: the non-typewriter typewriter face"
pkgrel=1
arch=('any')
license=('custom:HCo')
url='https://www.typography.com/fonts/operator/overview/'
source=("local://OperatorMono-Bold.otf"
        "local://OperatorMono-BoldItalic.otf"
        "local://OperatorMono-Book.otf"
        "local://OperatorMono-BookItalic.otf"
        "local://OperatorMono-Light.otf"
        "local://OperatorMono-LightItalic.otf"
        "local://OperatorMono-Medium.otf"
        "local://OperatorMono-MediumItalic.otf"
        "local://OperatorMono-XLight.otf"
        "local://OperatorMono-XLightItalic.otf")
md5sums=('4e3ca64b09ee0ed95df7f9c834356dd7'
         '79a2c130549d00fb2b1b5fa60233f60d'
         'd49e36f086d6ae880be8ada17f273882'
         '6e2eb8409e2ea9b4552d75c605f81963'
         '0d2e116a74f03ae40bd2d6e5378fe2cf'
         '8223460c7d740a987343efc3399835a5'
         '4694537a06d77cf9e31e295347915121'
         '8419f477f7e0cd6649381ffd776bf07c'
         'a6dc0c1dee9aa75d03d164c6ca9faa4d'
         '1b30b3ad5304495676bdf319d5c5bf49')

package() {
    # Prepare destination directory
    install -dm 755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    for font in "${source[@]}"; do
        install -m 644 "${font/local:\/\//}" "$pkgdir/usr/share/fonts/OTF"
    done
}
