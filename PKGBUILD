# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.7.1
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
sha256sums=('ad2d43a082b320a2891a1594015ee09d10a38cc377d1c325a2f2bdae22286c4c')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
