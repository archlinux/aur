# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=otf-fontemon
pkgver=1.0
pkgrel=1
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

md5sums=('2947d671b765cbfcf3289dd463111768'
    '51caa4b85386853fd78074268631693d')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
}
