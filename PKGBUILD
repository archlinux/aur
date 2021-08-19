# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.2.1
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python-adb_shell' 'python' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-rich' 'python-tld' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('19b3e22f27687e3e518b54fa99c8ed1f616aca65ef3273e0ddcb33b996ccedb729546680ff3504de74c6a308f0fff4bca726a2075955ecfe29344e41195ee923')

build() {
    cd "mvt-${pkgver}"
    python setup.py build
}

package() {
    cd "mvt-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
