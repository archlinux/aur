# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.9.0
pkgrel=1
pkgdesc="Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_NF_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE")
sha256sums=('123b2179866f5a291c15cf34a83fdce6ac202e2fe6ad27fbd9ddd4f5bff23c65'
            '277cb874bbcf8a884e512bb2a01d62341d57286d8947057d652fab6488fc941c'
            '9bfc3b3826a9c71042b87fda90a19cda4918894cdbd449cab163b7a7c93c5aa7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGen_NF_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
