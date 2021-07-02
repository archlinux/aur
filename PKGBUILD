# Maintainer: taotieren <admin@taotieren.com>

pkgname=yoctools
pkgver=1.0.60
pkgrel=1
epoch=
pkgdesc="(Yun on Chip) 以极简开发为理念，以 CPU 架构、芯片平台、操作系统、云服务和开发套件为基础，助力开发者从芯片到云的全链路高效设计，是面向 IoT 领域的全栈技术平台"
arch=('any')
url="https://occ.t-head.cn/doc/docs/Chapter1-YoCE6A682E8BFB0/"
license=('BSD')
groups=()
depends=('python')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://yoctools.oss-cn-beijing.aliyuncs.com/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=('1c2257165837ea45938686a5e40eb01b4d24d939ad6b5319b74f4b2cc730d3bd')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
