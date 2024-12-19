# Maintainer: taotieren <admin@taotieren.com>

pkgbase=yoctools
pkgname=python-yoctools
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc="(Yun on Chip) 以极简开发为理念，以 CPU 架构、芯片平台、操作系统、云服务和开发套件为基础，助力开发者从芯片到云的全链路高效设计，是面向 IoT 领域的全栈技术平台"
# arch=('any')
arch=($CARCH)
url="https://pypi.org/project/yoctools/"
license=('BSD-2-Clause')
groups=()
depends=(
    sh
    scons
    'python'
    #     python-configupdater
    python-gitdb
    python-gitpython
    #     python-httplib2
    python-smmap
    python-ruamel-yaml
    #     python-threadpoolctl
    python-xlsxwriter
    #     python-urllib3
)
makedepends=(python-build
    python-installer
    python-setuptools
    python-wheel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=("${pkgbase}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
noextract=()
sha256sums=('65aa5a4973b95d3be84306df67d7af2859ab641e9290605cffb486c1045f58b5')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
