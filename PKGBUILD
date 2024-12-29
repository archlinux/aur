# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.10.0
pkgrel=1
pkgdesc="Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_NF_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE")
sha256sums=('ed182e2a4b95792d94dea7932f6b45280b5ae353651be249d5f6b7867b788db7'
            'f8abd483d5edfad88a78ed511978f43c83b43c48e364aa29ebe4a68217474428'
            '9bfc3b3826a9c71042b87fda90a19cda4918894cdbd449cab163b7a7c93c5aa7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGen_NF_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
