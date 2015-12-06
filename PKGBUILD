# Maintainer: Christian Karl <christian.karl@protonmail.com>

pkgname='vimiv-git'
pkgrel=1
pkgver=r41.597246c
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

    install -D -m755 vimiv "$pkgdir/usr/bin/vimiv"
    install -D -m644 vimivrc.py "$pkgdir/etc/vimiv/vimivrc.py"
    install -D -m644 vimiv.desktop "$pkgdir/usr/share/applications/vimiv.desktop"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/vimiv/LICENSE"
    install -D -m644 vimiv.1 "$pkgdir/usr/share/man/man1/vimiv.1"
}
