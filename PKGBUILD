# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=cavalcade
pkgver=0.8
pkgrel=4
pkgdesc="Python GUI wrapper for CAVA utility"
arch=('any')
url="https://github.com/worron/cavalcade"
license=('GPL')
depends=('python>=3.5' 'cava>=0.6' 'gtk3' 'python-cairo' 'python-gobject' 'gstreamer' 'gst-plugins-base' 'python-pillow' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/worron/cavalcade/archive/$pkgver.tar.gz")
md5sums=('ae80a99fc1b79c54cf225d8c3101b53a')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py build
}

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
