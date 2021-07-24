# Maintainer: taotieren <admin@taotieren.com>

pkgname=aos-tools
pkgver=1.1.9
pkgrel=1
epoch=
pkgdesc="aos-tools 是 AliOS Things 的命令行编译系统，支持组件管理、程序编译、烧录等功能。aos-tools 使用git 来获取组件的代码和维护代码的版本管理。"
arch=('any')
url="https://g.alicdn.com/alios-things-3.3/doc/aos-tools_user_manual.html"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.tuna.tsinghua.edu.cn/packages/a0/7b/a8d12285d2ef1001504b075e8ab619dc88d6dd846cf90667024e13c0cb61/aos-tools-1.1.9.tar.gz#sha256=8ac3d8d8a38261ed98e4c1f0ea699e8064a5e9b37e721a35f7bd98f215fadf27")
noextract=()
sha256sums=('8ac3d8d8a38261ed98e4c1f0ea699e8064a5e9b37e721a35f7bd98f215fadf27')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
