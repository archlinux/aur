# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.7.1
pkgrel=1
pkgdesc="Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_NF_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE")
sha256sums=('ec492a85dae77ff81818e75f775ec03bc391a96cf97c816fed1d221375b7be32'
            '3c1949682567f8b4d4984c30b1439f051f2062a3138ddbf2262c12d087f60d92'
            '9bfc3b3826a9c71042b87fda90a19cda4918894cdbd449cab163b7a7c93c5aa7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGen_NF_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
