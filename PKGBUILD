# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=python-timew-report
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="An interface for Timewarrior report data"
arch=('any')
license=('MIT')
url="https://github.com/lauft/timew-report"
depends=('python' 'python-dateutil' 'python-deprecation')
makedepends=('python-setuptools')
source=(
        "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    )
sha256sums=('439ec4dda62215ff347971095d99566678be3c9e3c5dbecdb8bed51fd4422f90')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

