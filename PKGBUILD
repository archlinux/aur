# Maintainer: taotieren <admin@taotieren.com>

pkgbase=yoctools
pkgname=python-yoctools
pkgver=2.0.67
pkgrel=1
epoch=
pkgdesc="(Yun on Chip) 以极简开发为理念，以 CPU 架构、芯片平台、操作系统、云服务和开发套件为基础，助力开发者从芯片到云的全链路高效设计，是面向 IoT 领域的全栈技术平台"
arch=('any')
url="https://pypi.org/project/yoctools/"
license=('BSD-2-Clause')
groups=()
depends=('python')
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
options=()
install=
changelog=
source=("${pkgbase}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgbase::1}/$pkgbase/$pkgbase-$pkgver.tar.gz")
noextract=()
sha256sums=('41b43692f68c07521515a62c2668a4ff540e444111d69bbc6f81605c73c4db2a')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
