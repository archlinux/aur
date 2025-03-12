# Maintainer: ZeroDegress <zerodegress@outlook.com>

_pkgname=html-greet
pkgname=${_pkgname}-git
pkgver=0.0.0.r29.f34c770
pkgrel=3
pkgdesc='Web based greeter for greetd'
url="https://github.com/HumXC/html-greet"
arch=('x86_64')
license=('custom')
depends=('greetd' 'webkit2gtk')
optdepends=('html-greet-frontend: default frontend')
makedepends=('wails' 'go')
conflicts=('html-greet')
provides=('html-greet')
source=("${_pkgname}::git+https://github.com/HumXC/html-greet.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "0.0.0.${_revision}"
}

build() {
    cd "${srcdir}"/${_pkgname}
    ./build.sh
}

package() {
    install -D -m755 "${srcdir}"/"${_pkgname}"/html-greet "${pkgdir}"/usr/bin/html-greet
}
