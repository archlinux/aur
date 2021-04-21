# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt
pkgrel=2
pkgver=0.8.0
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
sha256sums=('82a268c9a7c254eb1a94f796c1536a74a9fe505da34859803825f22d31c136b6')

package() {
    cd "$pkgname-$pkgver"
    make -f misc/Makefile DESTDIR="$pkgdir" install
}
