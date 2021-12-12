# Maintainer: Eric Fung <loseurmarbles at gmail dot com>

pkgname=vim-apprentice-git
pkgver=1.9.r53.g3491eda
pkgrel=1
pkgdesc="A dark, low-contrast colorscheme for Vim based on Sorcerer by Jeet Sukumaran"
arch=('any')
url="https://github.com/romainl/Apprentice"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
source=("${pkgname}::git+https://github.com/romainl/Apprentice.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/colors/apprentice.vim" \
                   "${pkgdir}/usr/share/vim/vimfiles/colors/apprentice.vim"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
