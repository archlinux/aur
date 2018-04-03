# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="budgetwarrior"
pkgver="1.0.1"
pkgrel="2"
pkgdesc="Simple command line utility to helps keeping track of your expenses and the state of your budget."
url="https://github.com/wichtounet/budgetwarrior"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('clang')
depends=('util-linux' 'openssl')
changelog="ChangeLog"
source=("git://github.com/wichtounet/budgetwarrior.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}/"

    git submodule init
    git submodule update
}

build() {
    cd "${srcdir}/${pkgname}/"

    make
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man3"
    install -d "${pkgdir}/usr/share/zsh/site-functions/"
    install -d "${pkgdir}/etc/bash_completion.d"
    make prefix="${pkgdir}/usr" install
}

# vim:set ts=4 sw=4 et:
