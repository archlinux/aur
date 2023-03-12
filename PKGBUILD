# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sncli
pkgver=0.4.2
pkgrel=1
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/sncli"
license=('MIT')
depends=('python-simperium' 'python-urwid')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/insanum/sncli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a155cdc6c05d03a4ceb2212670fff657bc5021e358931679d805eb2e8c227731')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
