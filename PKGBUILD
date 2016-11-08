# Maintainer: Christian Karl <christian dot karl at protonmail dot com>

pkgname='vimiv'
pkgrel=1
pkgver=0.7
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
sha256sums=('461cafce19423101a99b14ea34530d4d297b817ff992419eb56487ac019b8067')

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
}
