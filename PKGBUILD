# Contributor: giga300 <giga300[at]protonmail[dot]com>
# Maintainer: giga300 <giga300[at]protonmail[dot]com>

pkgname=4nxci-git
_pkgname=4NXCI
pkgver=v4.03.r2.g33044e6
pkgrel=1
pkgdesc='4NXCI is a tool for converting XCI(NX Card Image) files to NSP'
arch=('any')
url="https://github.com/The-4n/4NXCI"
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=("4nxci-bin")
conflicts=("4nxci-bin")
source=('git+https://github.com/The-4n/4NXCI.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}"
    cp config.mk.template config.mk
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}