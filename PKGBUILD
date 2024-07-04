# Maintainer: allddd <allddd (at) proton (dot) me>

pkgname=vim-plug-git
pkgver=r720.d863d07
pkgrel=2
pkgdesc='A vim plugin manager'
arch=('any')
url='https://github.com/junegunn/vim-plug'
license=('MIT')
depends=('vim')
makedepends=('git')
provides=('vim-plug')
conflicts=('vim-plug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 plug.vim -t "${pkgdir}/usr/share/vim/vimfiles/autoload/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 doc/plug.txt -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=4 sw=4 et:
