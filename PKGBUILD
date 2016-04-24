# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.5
pkgdesc="An image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
optdepends=('imagemagick: for the optimization of images'
            'jhead: for much better autorotation depending on EXIF data')
conflicts=('vimiv-git')
backup=('etc/vimiv/vimivrc' 'etc/vimiv/keys.conf')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('658480e4ec65f0cb345d2742588185d564ab54c399a98ee2f68bc6858f33ecfd')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}

post_upgrade() {
    printf "The new version comes with two new configuration files. The old \
file vimivrc.py can be removed. See vimivrc(5) for more information.\n"
}
