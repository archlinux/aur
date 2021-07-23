# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=mvt
pkgver=1.0.11
pkgrel=1
pkgdesc="Collection of utilities to simplify and automate the process of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices"
arch=(any)
url="https://github.com/mvt-project/mvt"
license=('custom')
depends=('libusb' 'python-adb_shell' 'python-biplist' 'python-click' 'python-iosbackup' 'python-libusb1' 'python-rich' 'python-tld' 'python-tqdm' 'python-requests' 'python-simplejson')
makedepends=('python-pip' 'python-setuptools')
source=("mvt-${pkgver}.tar.gz"::"https://github.com/mvt-project/mvt/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d711256d3e7d8b863d05fbce07f2c35f9e3e75d63287ce84534de52e13eac1a453d562c5647e8eccde8145eb7546a471e855f2ff93ce60d7e5ed97b65977ff97')

package() {
    cd "mvt-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
