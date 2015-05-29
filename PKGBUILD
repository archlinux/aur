# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="budgetwarrior"
pkgver="0.4.1.2"
pkgrel="1"
pkgdesc="Simple command line utility to helps keeping track of your expenses and the state of your budget."
url="https://github.com/wichtounet/budgetwarrior"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('clang')
depends=('boost' 'util-linux')
changelog="ChangeLog"
source=("https://github.com/wichtounet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b0120b7265b71a34035f1cb622feeff8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man3"
    install -d "${pkgdir}/usr/share/zsh/site-functions/"
    install -d "${pkgdir}/etc/bash_completion.d"
    make prefix="${pkgdir}/usr" install
}

# vim:set ts=4 sw=4 et:
