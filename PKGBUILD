# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=otf-fontemon
pkgver=1.0
pkgrel=5
pkgdesc="World's first video game in a font."
arch=('any')
url='https://github.com/mmulet/font-game-engine'
license=('GPL-3.0-only')

_fontfiles=(
    'fontemon_small.otf'
)

source=()
for _file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${_file}::${url}/releases/download/${pkgver}/${_file}")
done

sha256sums=('9fa30993fbdd822ab8476ee992056f45d0abf0e31205291fa2cd142c8ec8300f')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
}
