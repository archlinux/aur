# Maintainer: taotieren <admin@taotieren.com>

pkgbase=yoctools
pkgname=python-yoctools
pkgver=2.0.65
pkgrel=1
epoch=
pkgdesc="(Yun on Chip) 以极简开发为理念，以 CPU 架构、芯片平台、操作系统、云服务和开发套件为基础，助力开发者从芯片到云的全链路高效设计，是面向 IoT 领域的全栈技术平台"
arch=('any')
url="https://pypi.org/project/yoctools/"
license=('BSD')
groups=()
depends=('python')
makedepends=(python-build
    python-installer
    python-wheel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgbase}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
noextract=()
sha256sums=('64ca0ed610e71c37f4115467461b39ff4885f2edb863d6d7d2b9ee03c4873f96')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
#     python setup.py build
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
#     export PYTHONHASHSEED=0
#     python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
