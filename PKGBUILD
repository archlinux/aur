# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=otf-brass-mono
pkgver=0.0.5
pkgrel=1
pkgdesc="Retro monospaced font inspired by 70's design."
arch=('any')
url='https://github.com/fonsecapeter/brass_mono'
license=('custom:OLF')
depends=()
source=("${pkgname}-${pkgver}.zip::https://github.com/fonsecapeter/brass_mono/releases/download/v${pkgver}/BrassMono.zip")
sha512sums=('0c145da9d225e25437e8971a837bdde9b62e564e907b144de759f766c110a7a12101915c6d74837cb3c97a7a66e1db7a2185193da9c723a186dd3d834d566fcc')

package() {
    cd "BrassMono"

    # Install fonts
    install -dm0755 "${pkgdir}"/usr/share/fonts/OTF

    for font in *.otf; do
        install -m0644 $font "${pkgdir}"/usr/share/fonts/OTF/BrassMono-"${font/_/-}"
    done

    # Install license
    install -Dm0644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
