# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.5
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python' 'python-adb_shell' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-packaging' 'python-rich' 'python-tld' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('09845ebe3dd5b93d570a93543967d527e4830475a04af72e91af97dcb44f974153518f521654866029bf76b84e25d9a748e4cca14c617a9218fc4067a758d17c')

build() {
    cd "mvt-${pkgver}"
    python setup.py build
}

package() {
    cd "mvt-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
