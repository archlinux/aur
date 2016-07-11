# Maintainer: NBonaparte <9f64e20e at opayq dot com>
pkgname=ttf-material-design-icons-git
pkgver=v1.6.50.r0.ga791eeb
pkgrel=1
pkgdesc="Material Design Icons Web Font"
arch=('any')
url='https://materialdesignicons.com'
licence=('SIL OPEN FONT LICENSE Version 1.1')
depends=(fontconfig xorg-font-utils)
makedepends=('git')
install=$pkgname.install
source=('git+https://github.com/Templarian/MaterialDesign-Webfont.git')
md5sums=('SKIP')

pkgver() {
    cd MaterialDesign-Webfont
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/MaterialDesign-Webfont/fonts
    install -D -m644 "materialdesignicons-webfont.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialDesignIcons.ttf"
}
