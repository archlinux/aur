# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=ttf-merriweather-serif
pkgname=${_pkgname}-git
pkgver=r11.1808141
pkgrel=1
pkgdesc='Merriweather Serif fonts'
arch=('any')
license=('SIL Open Font License 1.1')
url="https://github.com/EbenSorkin/Merriweather"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
install=("${_pkgname}.install")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" ${srcdir}/${_pkgname}/*.ttf
}
