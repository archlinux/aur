# Maintainer: arjan5 <aur@anymore.nl>

pkgname=qubes-usb-proxy
pkgver=1.0.13
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64" "i686")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha256sums=('d7d8685f302c2eb8c92f68a9f3e2f3361efa1e580d5b48ffeda5c48ed3bf8622')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
