# Maintainer: Paco Pascal <me@pacopascal.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: lantw44 (at) gmail (dot) com

_checkoutdir='scheme-bytestructures'
_pkgname='guile-bytestructures'
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile.'
arch=('any')
url='https://github.com/TaylanUB/scheme-bytestructures'
license=('GPL3')
options=('!strip')
depends=('guile')
makedepends=('autoconf' 'automake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/TaylanUB/scheme-bytestructures.git')
md5sums=('SKIP')

prepare() {
    cd "${_checkoutdir}"
    aclocal
    autoconf
    automake --add-missing
}

build() {
    cd "${_checkoutdir}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_checkoutdir}"
    make DESTDIR="${pkgdir}" install
}
