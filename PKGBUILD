# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="secfetch"
pkgver=1.1
pkgrel=1
pkgdesc="Lightweight security state inspector for Linux"

license=('GPL-3.0')
arch=('any')

url="https://github.com/ake13-art/secfetch"

provides=("${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('457436502ea237e193ca0b11e969ef2d60edd71bb331c31199ebde431b41f3a6')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps .

    python -O -m compileall "${pkgdir}"
}
