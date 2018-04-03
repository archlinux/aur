# Maintainer: Ingo Bürk <admin at airblader dot de>
pkgname=vim-airline-gruvbox-git
pkgver=v2.0.0.r66.gcb4e7a5
pkgrel=1
pkgdesc="gruvbox color scheme for vim-airline"
arch=('any')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=('vim' 'vim-airline')
optdepends=('vim-gruvbox-git')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/morhetz/gruvbox.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/-/.r/;s/-/./' 
}

package() {
    install -Dm755 ${srcdir}/${pkgname}/autoload/airline/themes/gruvbox.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/airline/themes/gruvbox.vim
}
