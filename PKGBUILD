pkgname=push2talk-git
_pkgname=${pkgname%-git}
pkgver=1.0.0
pkgrel=1
pkgdesc="Push to talk application."
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/push2talk"
license=('ISC')
depends=('pulseaudio' 'libxi' 'libevdev')
makedepends=('cargo' 'git' 'pkg-config')
conflicts=("push2talk" "push2talk-bin")
provides=("push2talk")
source=("${_pkgname}::git+$url.git#branch=main")
validpgpkeys=('C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums=('SKIP')

check() {
    cd "${_pkgname}"
    make test
}

build() {
    cd "${_pkgname}"
    make build
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
