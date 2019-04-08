# Maintainer: Hussein Al Abry <zidhussein at gmail dot com>
pkgname=ttf-material-icons-git
pkgver=r124.224895a86
pkgrel=1
pkgdesc="Google Material Design icon font"
arch=('any')
url='https://github.com/google/material-design-icons'
license=('Apache')
depends=(fontconfig xorg-font-utils)
makedepends=('git')
replaces=(ttf-material-icons)
install=$pkgname.install
source=('git://github.com/google/material-design-icons.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/material-design-icons
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/material-design-icons/iconfont
    install -D -m644 "MaterialIcons-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialIcons-Regular.ttf"
}
