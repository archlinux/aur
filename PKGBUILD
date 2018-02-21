# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: N. Izumi aka izmntuk

pkgname=otf-russkopis
_fontname=Russkopis
pkgver=0.0.1
pkgrel=2
pkgdesc='A Free Cyrillic cursive font for Russian, Ukrainian, Belarusian, and Bulgarian'
url='https://github.com/MihailJP/Russkopis'
license=('X11')
arch=('any')
makedepends=('fontforge')
depends=('fontconfig' 'xorg-font-utils')
sha256sums=('1ac0338ea957b553cdcb427fdab0ccbeb66685c45fd2852fa7371407605b577b')
source=("https://github.com/MihailJP/${_fontname}/archive/${pkgver}.tar.gz")

build() {
    cd ${_fontname}-${pkgver}
    make
}

package() {
    cd ${_fontname}-${pkgver}
    install -d ${pkgdir}/usr/share/{doc,licenses}/${pkgname} ${pkgdir}/usr/share/fonts/OTF
    install -pm644 README{,.{ja,ru}.utf8} ${pkgdir}/usr/share/doc/${pkgname}
    install -pm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    install -pm644 ${_fontname}-{Normalny,Zhirny}.otf ${pkgdir}/usr/share/fonts/OTF
}
