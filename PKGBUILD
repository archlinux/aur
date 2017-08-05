# Maintainer: Eric Fung <loseurmarbles at gmail dot com>

pkgname=vim-apprentice-git
pkgver=v1.9.r17.g5ec83e1
pkgrel=1
pkgdesc="A dark, low-contrast colorscheme for Vim based on Sorcerer by Jeet Sukumaran"
arch=('any')
url="https://github.com/romainl/Apprentice"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/romainl/Apprentice.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/-/.r/;s/-/./' 
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/colors/apprentice.vim" "${pkgdir}/usr/share/vim/vimfiles/colors/apprentice.vim"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
