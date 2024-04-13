# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=edge-frfox
pkgver=24.4.10
pkgrel=1
pkgdesc="A Firefox userChrome.css theme that aims to recreate the look and feel of Microsoft Edge."
arch=('any')
url="https://github.com/bmFtZQ/edge-frfox"
license=('MIT')
optdepends=('firefox: primary compatible browser'
            'librewolf: alternative compatible browser')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9f9f5e358870cb8e4a6ebcd09f002c611c5e95834dc2950f88e906244d0c119')

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/${pkgname}"

    for item in user.js sidebery.json chrome/
    do
        cp -ra "${item}" "${pkgdir}/usr/share/${pkgname}"
    done

    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
