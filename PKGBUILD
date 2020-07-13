# Maintainer: NBonaparte <nbonaparte at protonmail dot com>
pkgname=ttf-material-design-icons-git
pkgver=v5.3.45.r0.gcb85f87
pkgrel=1
pkgdesc="Material Design Icons Web Font"
arch=('any')
url='https://materialdesignicons.com'
licence=('SIL OPEN FONT LICENSE Version 1.1')
makedepends=('git')
source=('git+https://github.com/Templarian/MaterialDesign-Webfont.git')
md5sums=('SKIP')

pkgver() {
    cd MaterialDesign-Webfont
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/MaterialDesign-Webfont/fonts
    install -D -m644 "materialdesignicons-webfont.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialDesignIcons.ttf"
}
