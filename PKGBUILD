# Maintainer: Ralph Zhou  <1694487365@qq.com>

pkgname=q5go-git
_pkgname=q5go
pkgver=20200314.3968725
pkgrel=1
pkgdesc='Go Client based on Qt 5, Support KataGo/LeeLa Zero analysis Pandanet and SGF edition'
url='https://github.com/pzorin/qgo'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
makedepends=('git')
depends=('qt5-multimedia' 'qt5-tools')
source=("git://github.com/bernds/q5go.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}/src"
	#qmake-qt5
    qmake ./q5go.pro PREFIX=${pkgdir}/usr
	make
}

package() {
    cd "${srcdir}/${_pkgname}/src"
    make install
}
