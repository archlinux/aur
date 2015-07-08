# Maintainer: Dan Van Boxel <the.dvb@gmail.com>

pkgname=slimux-git
pkgver=1.0.0.2d54abbabf
pkgrel=1
pkgdesc="SLIME inspired tmux integration plugin for Vim"
arch=('any')
url="https://github.com/epeli/${pkgname%-git}"
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'tmux')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/epeli/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
