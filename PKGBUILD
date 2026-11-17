# Maintainer: Amro Emad <korialo001[at]gmail[dot]com>
# Contibutor: haawda <stefan-husmann@t-online.de>
# Contibutor: Phoenix <sponar.ondra@centrum.cz>

pkgbase=lexend-fonts-git
_name=${pkgbase%%-*}
pkgname=('woff2-lexend-fonts-git' 'ttf-lexend-fonts-git' 'ttf-lexend-fonts-variable-git')
pkgver=r114.7894f02
pkgrel=3
epoch=1
pkgdesc='A variable font family designed to aid in reading proficiency.'
url="https://lexend.com"
arch=('any')
license=('OFL-1.1-RFN')
makedepends=('git')
source=('git+https://github.com/googlefonts/lexend.git')
sha256sums=('SKIP')
_list=('deca' 'exa' 'giga' 'lexend' 'mega' 'peta' 'tera' 'zetta')

pkgver() {
    cd "${_name}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_ttf-lexend-fonts-git() {
  pkgdesc="${pkgdesc} - ttf format"
  provides=('ttf-lexend-fonts')

    cd "${_name}"

    for _f in ${_list[@]}; do
        install -Dm 644 ./fonts/${_f}/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    done
    install -Dm 644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}

package_ttf-lexend-fonts-variable-git() {
  pkgdesc="${pkgdesc} - variable format"
  provides=('ttf-lexend-fonts-variable')

    cd "${_name}"

    for _f in ${_list[@]}; do
        install -Dm 644 ./fonts/${_f}/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    done
    install -Dm 644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}

package_woff2-lexend-fonts-git() {
  pkgdesc="${pkgdesc} - woff2 format"
  provides=('woff2-lexend-fonts')

    cd "${_name}"

    install -Dm 644 ./fonts/lexend/webfonts/*.woff2 -t "${pkgdir}/usr/share/fonts/WOFF2"
    install -Dm 644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
