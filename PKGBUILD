# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname='vimiv-git'
pkgrel=1
pkgver=r496.969436e
pkgdesc="An image viewer with vim-like keybindings"
install="vimiv-git.install"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
makedepends=('git' 'python-setuptools')
optdepends=('jhead: for much better autorotation depending on EXIF data')
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
