# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=python-easyhid
pkgver=0.0.10
pkgrel=1
epoch=
pkgdesc="simple library for reading/writing to HID devices"
arch=('any')
url="https://github.com/ahtn/python-easyhid"
license=('MIT')
groups=()
depends=('python-cffi' 'hidapi')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=('python-easyhid')
conflicts=('python-easyhid')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha512sums=(
    '17f21c16699e45972d9a7a87719e16ec4f60a2a9d0b863a94ac092c585fee682d75adc2cbc3bc5f000a1b8299869526c7644d585bf9ef3a5de653e48d756f75b'
)
noextract=()
validpgpkeys=()

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
