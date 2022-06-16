# Maintainer: Gianluca Mascolo <gianluca@gurutech.it>

makedepends=(python-build python-installer python-poetry python-pytest)
depends=(python python-yaml python-gobject python-pyotp gtk3 sops)
source=('https://github.com/gianluca-mascolo/otpgui/archive/refs/tags/0.1.2.tar.gz')
sha256sums=('40d393d9f11851bb8c8dab7396d3a2f2dd720318629252ea5451a902ba75765c')
pkgname=otpgui
pkgver=0.1.2
arch=('any')
license=('GPL')
pkgrel=1
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$pkgname-$pkgver"
    pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
