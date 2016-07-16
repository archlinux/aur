# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.6
pkgdesc="An image viewer with vim-like keybindings"
arch=('any')
url="https://github.com/karlch/vimiv"
license=('MIT')
depends=('python3' 'python-gobject' 'gtk3' 'python-pillow')
makedepends=('python-setuptools')
optdepends=('imagemagick: for the optimization of images'
            'jhead: for much better autorotation depending on EXIF data')
conflicts=('vimiv')
backup=('etc/vimiv/vimivrc' 'etc/vimiv/keys.conf')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4431e9e1a2ba59c3394c666ee5689bef4e32a82b639816b8c8d519fbb1413bb5')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
