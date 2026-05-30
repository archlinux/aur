# Maintainer: faux_x2 <4500@duck.com>
pkgname=ttf-saitamaar-git
pkgver=r14.695bee7
pkgrel=1
pkgdesc="Font designed for ASCII art and Japanese SJIS-Art (Shift JIS Art)"
arch=('any')
url="https://github.com/asciiart-development/SaitamaarFont"
license=('OFL-1.1')
makedepends=('git')
provides=('ttf-saitamaar' 'otf-saitamaar')
conflicts=('ttf-saitamaar' 'otf-saitamaar')
source=("${pkgname}::git+https://github.com/asciiart-development/SaitamaarFont.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    install -Dm644 fonts/ttf/Saitamaar-Regular.ttf \
        "${pkgdir}/usr/share/fonts/TTF/Saitamaar-Regular.ttf"

    install -Dm644 fonts/otf/Saitamaar-Regular.otf \
        "${pkgdir}/usr/share/fonts/OTF/Saitamaar-Regular.otf"

    install -Dm644 OFL.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
