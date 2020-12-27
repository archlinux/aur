# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname='camomile'
pkgdesc='Camomile is a plugin with Pure Data embedded that offers to load and to control patches inside a digital audio workstation'
pkgver=1.0.7
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
depends=('freetype2')
makedepends=()
optdepends=()
conflicts=('camomile-git')
replaces=('camomile-git')
arch=('x86_64')
url='https://github.com/pierreguillot/Camomile'
license=('GPL3')
source=("https://github.com/pierreguillot/Camomile/releases/download/v${pkgver}/CamomileLinux64.zip")
sha512sums=('87d352a858f357006d710704c19923da0785f9c594e3aba4e3b1090359ef5668a3ab5dd67c5cd65c354b950215589b8c688808b07b0d0156ac8bc766b39d7642')

build () {
    cd "${srcdir}/Camomile"
   ./camomile
}

package () {
    cd "${srcdir}/Camomile"
    mkdir -p "${pkgdir}/usr/lib/lv2"
    find builds -type d -name '*.lv2' -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3"
    find builds -type d -name '*.vst3' -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
}
