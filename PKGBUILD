# Maintainer: slimymars <slimymars at gmail dot com>
# Contributor: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=ttf-hackgen
pkgver=2.8.0
pkgrel=1
pkgdesc="Composite font of Hack and GenJyuu-Gothic. This package includes HackGen-Nerd."
arch=("any")
url="https://github.com/yuru7/HackGen"
license=("custom")
source=("https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_v${pkgver}.zip"
        "https://github.com/yuru7/HackGen/releases/download/v${pkgver}/HackGen_NF_v${pkgver}.zip"
        "https://raw.githubusercontent.com/yuru7/HackGen/v${pkgver}/LICENSE")
sha256sums=('89ed3f0d8f6c3976a76594e659067a3fa57840a0cb44c601f8b36cc21f87b7c5'
            '25cdd1487cc46df384d32c041303b4a04541fd61d0b973e8bb38fd1a3de65eb1'
            '9bfc3b3826a9c71042b87fda90a19cda4918894cdbd449cab163b7a7c93c5aa7')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 HackGen_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -m644 HackGen_NF_v${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/

    cd ${srcdir}

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
