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
sha256sums=('4f9ddd7a257ee78d7f482544f85923ebc9b64bbd9c2146e02bc7f1a9f6603a06'
            '1803bdfdef39a3e9ae515797ef384ba0ecbc8cfd3757b94f622ceae1edb4badc'
            'a5e8f4ef2788ac9962510fd3749e5cb3cb08d3815cc6958033d4cb79e7decc2a'
            'f5fce9bf538c53d60e984d1d7de8e7ef1dc0f1cb9ba6bc79604493512b09af9d'
            'eab5b7922f5615ab4482a81e877b306f9bd88c3a2d80a3ced5f89dbdb012b93b'
            '1b035d3c70b69f50d8f0041a3638c928e5f55f10063cf2383f3f74dbbc103604'
            'b9a63f79d44cd64059a52aeada26ba115709c5c20ede41a858a40ade7b6e745f'
            '52927ae517e283ac1a8405411057079b02e64580710ccad601fb014461c62c86'
            '79393090324ee46ce0df417824ee20d66bbd80fba568faa7ba1b0de4c5524bb4'
            '5c24de6db2fd2b86fba270e3129d539091906bec4704e84927a0220042afe81b')

package() {
    # Prepare destination directory
    install -dm 755 "$pkgdir/usr/share/fonts/OTF"

    # Install fonts
    for font in "${source[@]}"; do
        install -m 644 "${font/local:\/\//}" "$pkgdir/usr/share/fonts/OTF"
    done
}
