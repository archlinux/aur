# Maintainer: Trần Nam Tuấn <tuantran1632001 at gmail dot com>
# Contributor: Marco Mania <marcomania2012 at gmail dot com>

pkgname=fish-tide
_pkgname=tide
pkgver=7.2.1
pkgrel=1
pkgdesc="🌊 The ultimate Fish prompt."
arch=('any')
url="https://github.com/plttn/tide"
license=('MIT')
depends=('fish')
optdepends=('ttf-meslo-nerd-font-powerlevel10k: recommended font, install this if you only want Meslo LGS Nerd Font variants'
            'ttf-meslo-nerd: recommended font, contains all Meslo Nerd Font variants')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8919835517566bc4211db71a16d9616c61e4ad5589fac0bebcae99f69cc13e0c')

package() {
    cd "${_pkgname}-${pkgver}"

    find conf.d functions -type f -exec install -Dm 755 '{}' "${pkgdir}/etc/fish/{}" \;

    install -Dm644 completions/* -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

    install -Dm755 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
