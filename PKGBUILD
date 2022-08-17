# Maintainer: Batuhan Baserdem <last.first@gmail.com>
name='scientifica'
pkgname="${name}-font"
pkgver='2.3'
pkgrel=1
pkgdesc="Tall and condensed bitmap font for geeks."
url="https://github.com/NerdyPepper/${name}"
license=('OFL')
source=(
    "${name}.tar::${url}/releases/download/v${pkgver}/${name}.tar"
    "${name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'f0857869a0e846c6f175dcb853dd1f119ea17a75218e63b7f0736d5a8e1e8a7f'
    '00ab57863c3004c5e2148426ef87649cffe66ed240a49b82243ca8916a2da096'
)
arch=('any')
conflicts=(
    "${name}-ttf"
    "${name}-otb"
    "ttf-${name}"
    "otb-${name}"
)
provides=(
    "ttf-${name}"
    "otb-${name}"
)
package() {
    # Install the TrueType fonts
    install -D --mode=644 "${srcdir}/${name}/ttf/${name}"*.ttf \
        --target-directory "${pkgdir}/usr/share/fonts/TTF"
    # Install the OpenType bitmap fonts
    install -D --mode=644 "${srcdir}/${name}/otb/${name}"*.otb \
        --target-directory "${pkgdir}/usr/share/fonts/misc"
    # Install the license
    install -D --mode=644 "${srcdir}/${name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
