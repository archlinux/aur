# Maintainer: zero2cx <zero2cx@gmail.com>

pkgname=pacvim-git
pkgver=v1.1.1.r10.gb0934ca
pkgrel=1
pkgdesc="A game that teaches you vim commands. Inspired by Namco's classic PAC-MAN."
arch=('i686' 'x86_64')
url='https://github.com/jmoon018/PacVim'
license=('LGPL3')
depends=('ncurses')
makedepends=('git')
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
        cd "${srcdir}/${pkgname%-git}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${pkgname%-git}"
        make PREFIX=/usr
}

package() {
        cd "${srcdir}/${pkgname%-git}"
        make PREFIX="${pkgdir}/usr" install
}
