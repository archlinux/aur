# Maintainer:  kernel1024 <kernelonline at gmail dot com>

pkgname=qregedit-git
_pkgname=qregedit
pkgver=20230428.7650144
pkgrel=1
pkgdesc="Windows registry editor written with Qt, based on chntpw code"
arch=('i686' 'x86_64')
url="https://github.com/kernel1024/qregedit"
license=('GPL2')

depends=('qt6-base')

makedepends=('git')
source=("git+https://github.com/kernel1024/qregedit.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build () {
    cd "$srcdir/${_pkgname}"
    qmake6
    make
}

package () {
    cd "$srcdir/${_pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
