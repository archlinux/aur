# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.7.3
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
sha256sums=('79032320bf3181a879202f2e980918eb24c38593673cb9a0e396e5377e3101e4')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
