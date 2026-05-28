# Maintainer: Thomas Wearmouth <tomwmth@pm.me>

pkgname='posys-cursor-scalable'
pkgver='1.3'
pkgrel=1
pkgdesc="Posy's cursor theme made scalable with SVGs, packaged as a hyprcursor and Plasma cursor"
arch=('any')
url='https://github.com/Morxemplum/posys-cursor-scalable'
license=('CC-BY-NC-4.0')
source=(
    "${url}/releases/download/v${pkgver}/hyprcursor_white_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/hyprcursor_black_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/hyprcursor_mono_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/hyprcursor_mono_black_v${pkgver}.tar.gz"

    "${url}/releases/download/v${pkgver}/plasma_white_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/plasma_black_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/plasma_mono_v${pkgver}.tar.gz"
    "${url}/releases/download/v${pkgver}/plasma_mono_black_v${pkgver}.tar.gz"
)
sha256sums=(
    'a12b0262a81e6abdc0d9269f261c06e2e0c2043e0951bd65065cd816dc480e86'
    'fcd161a59e869bdb1637c48ebdb9dedc65da1b588a8e6413423edb9e51792502'
    '6f2f0724b34108df683490d97a03944046e045f7b910e4c326877c130d02891a'
    'ecfc38e2ba0189ebff94a0bf29fc8d855034f158fbccb7cccadd0c3705e9a274'

    '5fc1617a9fba84ec663afe1e8a221ad2a67047b3347908ca8bfac29035fc4d92'
    '8156925d5329c30f09fd40deb9bc94bae3689cbbc6a6fb4b1bd0fcf46d0d3b4a'
    '86573a7e80211ec925768b750b76e22282a82b538511289593c949f76242be14'
    '0ef517b8e9806cfda0d9ed526b9e2033063375b47bc0ca5fb262307a8f53483c'
)

package() {
    local hyprcursor_themes=(
        'theme_Posys-Cursor-Scalable'
        'theme_Posys-Cursor-Scalable-Black'
        'theme_Posys-Cursor-Scalable-Mono'
        'theme_Posys-Cursor-Scalable-Mono-Black'
    )
    local plasma_themes=(
        'posys_cursor_scalable'
        'posys_cursor_scalable_black'
        'posys_cursor_scalable_mono'
        'posys_cursor_scalable_mono_black'
    )
    local install_names=(
        'Posys_Cursor'
        'Posys_Cursor_Black'
        'Posys_Cursor_Mono'
        'Posys_Cursor_Mono_Black'
    )

    for i in "${!install_names[@]}"; do
        local dest="${pkgdir}/usr/share/icons/${install_names[$i]}"
        install -d "${dest}"
        cp -r "${srcdir}/${hyprcursor_themes[$i]}/." "${dest}/"
        cp -r "${srcdir}/${plasma_themes[$i]}/." "${dest}/"
    done
}
