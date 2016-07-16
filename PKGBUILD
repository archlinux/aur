# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv-git'
pkgrel=1
pkgver=r148.f62f1eb
pkgdesc="An image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
makedepends=('git' 'python-setuptools')
optdepends=('imagemagick: for the optimization of images'
            'jhead: for much better autorotation depending on EXIF data')
conflicts=('vimiv')
provides=('vimiv')
backup=('etc/vimiv/vimivrc' 'etc/vimiv/keys.conf')
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
