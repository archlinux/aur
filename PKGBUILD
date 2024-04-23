# Maintainer: Allomyrina Volbot <volbot.tech@gmail.com>

pkgname=ttf-greybeard-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='a chunky monospaced bitmap programming font for old nerds that hate eyestrain'
arch=('any')
url='https://github.com/flowchartsman/greybeard'
license=('MIT')
conflicts=('ttf-greybeard' 'ttf-greybeard-git')
provides=('ttf-greybeard')
source=(
    "Greybeard-v${pkgver}-ttf.zip::${url}/releases/download/v${pkgver}/Greybeard-v${pkgver}-ttf.zip"
    "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
    'ddb9075cc4156e90f156bb17c2e91a59a731d3c9fc0350631adafa99d6affbf9'
    '1e2dd64b68b21c7fed75c008120c4d313740f90d992f3385218a97bfd58e4f04'
)

package () {
    find . -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/greybeard" \;
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

