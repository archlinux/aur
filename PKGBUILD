# Maintainer: jem <jem ΑΤ seethis DΟΤ link>
pkgname=python-efm8boot
pkgver=0.0.8
pkgrel=1
epoch=
pkgdesc="library for writing to efm8 factory bootloader"
arch=('any')
url="https://github.com/ahtn/python-efm8boot"
license=('MIT')
groups=()
depends=('python-easyhid' 'python-intelhex' 'python-crcmod')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=('python-efm8boot')
conflicts=('python-efm8boot')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha512sums=(
    'b12bde82331a2a4f0e23e62b473eb68c4968e6fa6f3081ea944fd59ef523c69e6c7cde210277e84cb00d45068a6146bbdc88cda38930e0dde9283acbf54eab88'
)
noextract=()
validpgpkeys=()

_srcdir="${pkgname}-${pkgver}"

build() {
    cd $_srcdir
    python setup.py build
}

package() {
    cd $_srcdir
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
