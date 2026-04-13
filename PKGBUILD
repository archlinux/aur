# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="secfetch"
pkgver=1.5.2
pkgrel=1
pkgdesc="Lightweight security state inspector for Linux"

license=('GPL-3.0')
arch=('any')

url="https://github.com/ake13-art/secfetch"

provides=("${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-pip')
depends=('python')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58b4a3e464c24dd5740ec0efe09560ad67e4f6727264915db16c5f89b8bcd832')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps .

    python -O -m compileall "${pkgdir}"
}
