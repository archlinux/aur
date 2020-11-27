# Maintainer: Paul Oppenheimer <bepvte@gmail.com>

pkgname=arc-darkest-theme-git
_pkgname=rtl88-Themes-Arc-Darkest
pkgdesc='A darker version of famous Arc theme'
pkgver=r1.c6621e2
pkgrel=1
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
source=('git+https://github.com/rtlewis88/rtl88-Themes.git#branch=Arc-Darkest')
url='https://github.com/rtlewis88/rtl88-Themes'
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -m755 -d "${pkgdir}/usr/share/themes"
    
    cp -r Arc-Darkest-3.38 "${pkgdir}/usr/share/themes/Arc-Darkest"
}

