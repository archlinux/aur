#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=vim-papercolor-git
pkgver=1.0.r38.g9051480
pkgrel=1
pkgdesc="PaperColor color scheme for vim"
arch=('any')
url="https://github.com/NLKNguyen/papercolor-theme"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("$pkgname::git+https://github.com/NLKNguyen/papercolor-theme.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "$srcdir/$pkgname/colors/PaperColor.vim" "$pkgdir/usr/share/vim/vimfiles/colors/PaperColor.vim"
}
