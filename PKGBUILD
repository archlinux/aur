# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>

pkgname=ps3mca_tool-git
pkgver=r3.26acc6b
pkgrel=2
pkgdesc='Command line utility to manage Playstation 2 Memory Cards using the PS3 Memory Card Adapter'
url='https://github.com/Dewey-Wilkerson/ps3mca_tool_linux/'
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=('libusb' 'libusb-compat' 'ps3mca-udev-rules')
makedepends=('cmake' 'git')
source=(
    "git+https://github.com/Dewey-Wilkerson/ps3mca_tool_linux#branch=linux"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd $srcdir/ps3mca_tool_linux
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/ps3mca_tool_linux && ./build.sh
}

package() {

    install -Dm755 $srcdir/ps3mca_tool_linux/build/ps3mca $pkgdir/usr/bin/ps3mca
}
