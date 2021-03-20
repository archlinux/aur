# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=python-pyevtk
pkgver=2.0.0
pkgrel=1
pkgdesc='Export data as binary VTK files'
arch=('any')
url='https://github.com/paulo-herrera/PyEVTK'
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=()
source=( "${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65dda5511dba63ae55777ba01a50d24f8506f76985eba94ff83191c08f2b076c')

package() {
    cd "$srcdir/PyEVTK-$pkgver"

    install -D -m644 "evtk/LICENSE" \
                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    python setup.py install --optimize=1 --root="$pkgdir"
}

