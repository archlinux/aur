# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief
_name=modern_colorthief
pkgver=0.1.12
pkgrel=1
pkgdesc="A modern color thief"
arch=('x86_64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python')
makedepends=('python-installer')
conflicts=("$_name-git")
source=("https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.12/modern_colorthief-0.1.12-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
sha256sums=('4924dcc3048b5a28d2d90c03319815d60d5242d29c14e89da93c79469242f170')

package() {
    _pyver="cp$(${PYTHON:-python} -c 'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")')"
    ${PYTHON:-python} -m installer --destdir="$pkgdir" *"${_pyver}"*.whl
}
