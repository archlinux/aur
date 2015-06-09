# Maintainer: Magnus Therning <magnus@therning.org>

pkgname=git-imerge-git
_pkgname=git-imerge
pkgver=0
pkgrel=1
pkgdesc='Incremental merge for git'
arch=('any')
license='GPL2'
url='https://github.com/mhagger/git-imerge'
depends=('python2' 'git')
makedepends=('git')
changelog=${pkgname}.changelog
source=('git://github.com/mhagger/git-imerge.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    echo "nothing to build"
}

package () {
    cd "${srcdir}"/${_pkgname}
    install -D -m755 git-imerge "${pkgdir}"/usr/bin/git-imerge
}
