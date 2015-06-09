#Maintainer : Grigory Mishchenko <grishkokot[at]gmail[dot]com>

pkgname=kindness-git
pkgver=0.1.1.gc86a7de
pkgrel=1
pkgdesc='Some cool stuff for awesome wm'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/kindlycat/kindness.git'
depends=('awesome-git')

source=($pkgname::git+http://github.com/kindlycat/kindness.git)
md5sums=('SKIP')

_gitname="kindness"

pkgver() {
    cd "${pkgname}"
    git describe --always | sed 's|-|.|g' | sed 's/v//g'
}

package() {
    cd "${pkgname}"

    # Install library
    install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}"
    install -m644 *.lua "${pkgdir}/usr/share/awesome/lib/${_gitname}"
    ls
    # Install widgets
    install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}/widget"
    install -m644 widget/*.lua "${pkgdir}/usr/share/awesome/lib/${_gitname}/widget"

    # Install layouts
    install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}/layout"
    install -m644 layout/*.lua "${pkgdir}/usr/share/awesome/lib/${_gitname}/layout"
}