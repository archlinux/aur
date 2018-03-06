# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pypillowfight"
_pkgname="pypillowfight"
pkgver="0.2.3"
pkgrel="1"
pkgdesc="Library containing various image processing algorithms"
url="https://github.com/jflesch/libpillowfight"
depends=('python' )
makedepends=('python' 'python-setuptools' 'git')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("git+https://github.com/jflesch/${_pkgname}#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    make build
}

package() {
    cd ${srcdir}/${_pkgname}
    PIP_ARGS="--root=\"${pkgdir}\" --optimize=1" make install_py
}
