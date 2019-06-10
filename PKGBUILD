# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=python-kp_boot_32u4
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="tools for working with the kp_boot_32u4 bootloader"
arch=('any')
url="https://github.com/ahtn/kp_boot_32u4"
license=('MIT')
groups=()
depends=('python-easyhid' 'python-intelhex' 'python-hexdump')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=('python-kp_boot_32u4')
conflicts=('python-kp_boot_32u4')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/py-${pkgver}.tar.gz"

)
sha512sums=(
    '33af88f8868da157fd2d5f3c0b728fb412828aff9d2bebccf36a899b533afeacd9977e71e1aefd19f44bd9091d3227591cd45f577d258682acb22f9d7f89dfd0'
)
noextract=()
validpgpkeys=()

_srcdir="kp_boot_32u4-py-${pkgver}"

build() {
    cd $_srcdir
    python setup.py build
}

package() {
    cd $_srcdir
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
