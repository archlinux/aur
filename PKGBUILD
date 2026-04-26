# Maintainer: Evie B. <pk11@outlook.jp>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=bdf-unifont-jp
pkgver=17.0.04
pkgrel=1
pkgdesc="GNU Unifont Glyphs (Japanese)"
arch=(any)
license=('custom' 'GPL2')
url="https://ftp.gnu.org/gnu/unifont"
source=("${url}/unifont-${pkgver}/unifont_jp-${pkgver}.bdf.gz"{,.sig} "LICENSE")
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>
sha512sums=('ffd792260822980cf195f3368066d91d412af2d411cd7c378815dc4d55301f876932f282f9d7c0ab492b8918798fd100eda27e4df08ff082c262123ea91d907e'
            'SKIP'
            '064e7c0afe836d48610fcdd5d2d080c2583be0f2b70e565440d743072f41a242aec29a500df7a2bd39f423089c291250eabe0cefae5d000aecd7f27a052ee242')

package() {
  gzip -d --force "$srcdir"/unifont_jp-${pkgver}.bdf.gz
  install -Dm644 "${srcdir}/unifont_jp-${pkgver}.bdf" \
    "${pkgdir}/usr/share/fonts/misc/unifont.bdf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
