# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=trlinux-git
pkgver=r524.0f524aa
pkgrel=1
pkgdesc="N6TR's TR log "
arch=('any')
license=('GPL2')
url="https://github.com/trlinux/trlinux"
makedepends=('git' 'fpc' 'texlive-core')
depends=('libusb' 'libsieee1284' 'curl' 'alsa-lib' 'libsndfile' 'nmap')
source=($pkgname::"git+$url.git")

sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    make
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/$pkgname
    make DESTDIR=$pkgdir install
}
