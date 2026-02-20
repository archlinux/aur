pkgname=pmt-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal UI package manager for Arch Linux'
arch=('x86_64')
url='https://github.com/aethstetic/pmt'
license=('MIT')
depends=('pacman' 'openssl')
makedepends=('gcc' 'git')
provides=('pmt')
conflicts=('pmt')
source=("git+https://github.com/aethstetic/pmt.git")
sha256sums=('SKIP')

pkgver() {
    cd pmt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# compiles the binary from source
build() {
    cd pmt
    make
}

# installs the binary into the pacman package root
package() {
    cd pmt
    make DESTDIR="$pkgdir" install
}
