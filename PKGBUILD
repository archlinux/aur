# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=2
pkgver=0.6.1
pkgdesc='An image viewer with vim-like keybindings'
arch=('any')
url='https://github.com/karlch/vimiv-qt'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=(
    'qt5-svg: for svg support'
    'python-piexif: for exif support'
    'qt5-imageformats: for additional image formats'
)
conflicts=('vimiv' 'vimiv-git' 'vimiv-qt-git')
provides=('vimiv')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fc2ff23ec1d3bd06f8a10a41d0ca0fe8105fa7a23cd0499e0af0d82810713b68')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
