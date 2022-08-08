# Maintainer: László Koncz <konlaasz at gmail dot com>

pkgname=vim-colors-zenburn-git
pkgdesc='A low-contrast color scheme for Vim'
pkgver=r44.de2fa06
pkgrel=1
url='http://kippura.org/zenburnpage/'
arch=('any')
license=('GPL')
makedepends=('git')
depends=('vim')
provides=('vim-colors-zenburn')
conflicts=('vim-colorsamplerpack' 'vim-colorschemes')
source=("$pkgname::git+https://github.com/jnurmine/Zenburn.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 $pkgdir/usr/share/vim/vimfiles/colors
    install -Dm644 colors/* $pkgdir/usr/share/vim/vimfiles/colors/
}
