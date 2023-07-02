# Maintainer: CallMeEchoCodes <romanbarrettsarpi@pm.me>
_pkgname=fetcho
pkgname=${_pkgname}-git
pkgver=v1.1.0.r0.gbece325
pkgrel=1
pkgdesc='A simple fetch made in C++'
arch=('any')
url="https://github.com/CallMeEchoCodes/fetcho"
license=('MPL-2.0')
provides=( fetcho )
conflicts=( "${_pkgname}" )
source=("${_pkgname}::git+${url}.git")
package() {
   install -Dm755 "$srcdir/fetcho/build/release/bin/fetcho" "$pkgdir/usr/bin/fetcho"
}
build() {
   make RELEASE=1 -C "$srcdir/fetcho" build
}
pkgver() {
   cd "${_pkgname}"
   git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
depends=('libprocps')
sha256sums=('SKIP')
