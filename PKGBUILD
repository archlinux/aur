# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>

_gitname=urxvt-tabbedex
pkgname=${_gitname}-git
pkgver=26.16.1.r1.gfb0056c
pkgrel=1

pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
arch=("any")
url="https://github.com/mina86/${_gitname}"
license=("GPL-3.0-or-later")

depends=('rxvt-unicode')
makedepends=('git' 'perl')
provides=("${_gitname}")
conflicts=("${_gitname}")

source=("git+${url}.git")
sha512sums=('SKIP')
install=urxvt-tabbedex-git.install

pkgver() {
    cd "${_gitname}"
    git describe --tags --long | sed 's/^v//; s/-/-r/; s/-/./g'
}

build() {
    make -C "${srcdir}/${_gitname}"
}

package() {
    make -C "${srcdir}/${_gitname}" DESTDIR="${pkgdir}" install
}
