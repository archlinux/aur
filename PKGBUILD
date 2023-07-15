# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=1
pkgver=0.9.0
pkgdesc='An image viewer with vim-like keybindings'
arch=('any')
url='https://github.com/karlch/vimiv-qt'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=(
    'qt5-svg: for svg support'
    'qt5-imageformats: for additional image formats'
    'python-exiv2: for exif support'
    'python-piexif: alternative for exif support'
)
provides=('vimiv')
conflicts=('vimiv')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1a70a0b6620bba527aad0ca23936f1aa2823ed7592ae909fd920ba250720e88a')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
