# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sncli
pkgver=0.4.1
pkgrel=2
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/sncli"
license=('MIT')
depends=('python-simperium' 'python-urwid')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/insanum/sncli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7fd4d4e65b3b728c446a9674ac45be860e974c63c7fc31621671444604eb35f9')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
