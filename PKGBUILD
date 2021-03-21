# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=otf-fontemon
pkgver=1.0
pkgrel=2
pkgdesc="World's first video game in a font."
arch=('any')
url='https://github.com/mmulet/font-game-engine'
license=('GPL3')

_fontfiles=(
    'fontemon_small.otf'
    'fontemon_web.otf'
)

source=()
for file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${file}::${url}/releases/download/${pkgver}/${file}")
done

sha256sums=('9fa30993fbdd822ab8476ee992056f45d0abf0e31205291fa2cd142c8ec8300f'
            'd100f6cfa04b45370f6a6ee9d977765dc9ac48d651538579f1e88af13fb6ec32')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
}
