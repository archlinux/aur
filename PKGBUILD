# Maintainer: Landon Porter <landonp95@gmail.com>

_pkgname=humidify
pkgname="${_pkgname}-git"
pkgver=2024.08.01
pkgrel=1
pkgdesc="Rain in your terminal"
url="https://github.com/mazylol/humidify"
arch=('x86_64' 'i686')
license=('GPL-3.0-only')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

build() {
    cd "$srcdir/${_pkgname}"
    go build -ldflags="-s -w" -o "${_pkgname}"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

