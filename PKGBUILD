# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=keratin-git
_gitname=keratin
pkgver=1.0.0.r21.g7ea78cd
pkgrel=1
epoch=1
pkgdesc='A fork of clipmenu, a simple clipboard manager using dmenu and xsel/xclip'
url='https://github.com/WammKD/keratin'
arch=('any')
license=('ISC')
makedepends=('git')
depends=('dmenu' 'xsel')

source=(git+https://github.com/WammKD/keratin.git)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_gitname}"
    install -D -m755 keratin "${pkgdir}/usr/bin/keratin"
    install -D -m755 keratin-d "${pkgdir}/usr/bin/keratin-d"
}
