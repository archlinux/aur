# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=keratin-git
_gitname=keratin
pkgver=1.0.0.r20.g9f96e94
pkgrel=1
pkgdesc='a fork of clipmenu, a simple clipboard manager using dmenu and xsel/xclip'
url='https://github.com/llybin/keratin'
arch=('any')
license=('ISC')
depends=('dmenu' 'xsel')

source=(git+https://github.com/llybin/keratin.git)
md5sums=(SKIP)

pkgver() {
    cd "${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_gitname}"
    install -D -m755 keratin "${pkgdir}/usr/bin/keratin"
    install -D -m755 keratin-d "${pkgdir}/usr/bin/keratin-d"
}
