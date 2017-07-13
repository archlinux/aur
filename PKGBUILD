# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname='vimiv-git'
pkgrel=1
pkgver=r810.cedbeac
pkgdesc="An image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3')
makedepends=('git' 'python-setuptools')
optdepends=('libgexiv2: for exif support')
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
