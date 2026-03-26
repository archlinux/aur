# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="secfetch"
pkgver=1.5
pkgrel=1
pkgdesc="Lightweight security state inspector for Linux"

license=('GPL-3.0')
arch=('any')

url="https://github.com/ake13-art/secfetch"

provides=("${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')
depends=('python')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6b2a248bb23de9d7a19f7bdb39f01a75bc6a48200dc406fc9d2e09c64d2c475a')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps .

    python -O -m compileall "${pkgdir}"
}
