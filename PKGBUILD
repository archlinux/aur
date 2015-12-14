# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv-git'
pkgrel=1
pkgver=r46.720b6c4
pkgdesc="An image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
makedepends=('git')
optdepends=('imagemagick: for the optimization of images')
backup=('etc/vimiv/vimivrc.py')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir" install
}
