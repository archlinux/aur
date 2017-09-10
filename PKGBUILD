# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=vim-bracketed-paste
pkgver=r33.363f9b6
_commit=363f9b62d3aaa8f1cb6ba8abbeadecbef8d5cd42 # no available release
pkgrel=1
pkgdesc="enable transparent pasting into vim"
arch=('any')
url="https://github.com/ConradIrwin/$pkgname"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
source=("git+https://github.com/ConradIrwin/$pkgname.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 plugin/bracketed-paste.vim -t "$pkgdir"/usr/share/vim/vimfiles/plugin
}
