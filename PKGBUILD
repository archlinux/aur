# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.0
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python-adb_shell' 'python' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-rich' 'python-tld' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('553d7cfa35cf1459192282b968853c8b37d089f0394cad652421c852794a23762fe55597c50358043c98d833be66f50f7010c35c704af3d810eb4870ccc2e713')

build() {
    cd "mvt-${pkgver}"
    python setup.py build
}

package() {
    cd "mvt-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
