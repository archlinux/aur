# Maintainer: Charles Wang <charleszw16@gmail.com>

pkgname=sddm-theme-corners-git
pkgver=r28.b0d1b5a
pkgrel=1
pkgdesc="Theme for SDDM that puts stuff on the corners of the screen"
arch=('any')
url="https://github.com/aczw/sddm-theme-corners"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols2')
makedepends=('git')
backup=('usr/share/sddm/themes/corners/theme.conf')
source=('git+https://github.com/aczw/sddm-theme-corners.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/sddm-theme-corners"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/sddm-theme-corners"
    mkdir -p "${pkgdir}/usr/share/sddm/themes/"
    cp -r corners/ "${pkgdir}/usr/share/sddm/themes/"
}
