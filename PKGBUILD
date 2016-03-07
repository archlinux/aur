# Maintainer: krrr <guogaishiwo@gmail.com>
pkgname=hazama
pkgver=1.0.0
pkgrel=1
pkgdesc="Diary application"
arch=('any')
url="https://krrr.github.io/hazama"
license=('GPL')
depends=('python' 'python-pyside')
makedepends=('python-setuptools' 'python-pyside-tools')
source=("https://github.com/krrr/Hazama/archive/v$pkgver.tar.gz")

build() {
    cd "$srcdir/Hazama-$pkgver"
    ./setup.py build
}

package() {
    cd "$srcdir/Hazama-$pkgver"
    # --skip-build avoid building again when --root specified
    ./setup.py install --root "$pkgdir/" --skip-build
}
md5sums=('2a8883fe5ccc2e3734c1ac3035e9ccbd')
