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

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08a075f5b7900e5ae5f770f039f9b387368f2aaf696717341dfb6034356dd845')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps .

    python -O -m compileall "${pkgdir}"
}
