# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=python-xusbboot
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="python scripts for flashing atxmega xusb-boot bootloader"
arch=('any')
url="https://github.com/ahtn/xusb-boot"
license=('MIT')
groups=()
depends=('python-easyhid' 'python-intelhex' 'python-hexdump')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=('python-xusbboot')
conflicts=('python-xusbboot')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/py-${pkgver}.tar.gz"
)
sha512sums=(
    '6eb07ba738dac235f1bac85be9a5b43af670294a62d0216235f138e62602ed84ad6f455d7af90aa4e6ee3711420b3f207368a214e7af187cdb0670a072c8ec94'
)
noextract=()
validpgpkeys=()

_srcdir="xusb-boot-py-${pkgver}"/scripts

build() {
    cd $_srcdir
    python setup.py build
}

package() {
    cd $_srcdir
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
