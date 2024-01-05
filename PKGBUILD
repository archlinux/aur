# Maintainer: Albert Koczy <alufers@wp.pl>

pkgname=depthcharge-tools
pkgver=0.6.2
pkgrel=1
pkgdesc="Tools to manage the Chrome OS bootloader"
arch=('any')
url="https://github.com/alpernebbi/depthcharge-tools"
license=('GPL-2.0-or-later')
depends=('python')

source=("https://github.com/alpernebbi/depthcharge-tools/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('cba9f6d38aab1a00c98b180d9d762c935bd971f47d7b13eae030cd4c7d163cf0')  # The actual checksum will be different

build() {
  cd "${srcdir}/depthcharge-tools-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/depthcharge-tools-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
