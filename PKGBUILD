# Maintainer: Ingo Bürk <admin at airblader dot de>
pkgname=vim-gruvbox-git
pkgver=v2.0.0.r66.gcb4e7a5
pkgrel=1
pkgdesc="gruvbox color scheme for vim"
arch=('any')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/morhetz/gruvbox.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/colors/gruvbox.vim" "${pkgdir}/usr/share/vim/vimfiles/colors/gruvbox.vim"
    install -Dm755 "${srcdir}/${pkgname}/gruvbox_256palette.sh" "${pkgdir}/usr/share/vim/vimfiles/gruvbox_256palette.sh"
}
