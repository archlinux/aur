# Maintainer: Chenss <chenshisheng@reliachina.com>
reponame=linuxdeployqt
pkgname=$reponame-git
pkgver=1.0.r0.g69d837c
pkgrel=1
url="https://gitee.com/ufbycd/linuxdeployqt"
pkgdesc='linux deployment tool'
arch=('x86_64')
makedepends=('git' 'qt5-base')
depends=('qt5-base')
license=('GPL3')
conflicts=("$reponame")
provides=("$reponame")
source=("$pkgname::git+https://gitee.com/ufbycd/$reponame.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    qmake
    make
}

package() {
    cd $pkgname
    make INSTALL_ROOT="$pkgdir" install
}

# vim: set sw=4
