# Maintainer: Otto Sabart <aur@seberm.com>

pkgname=qubes-pass
pkgver=0.0.18
pkgrel=1
pkgdesc="An inter-VM password manager for Qubes OS "
arch=("x86_64" "i686")
url="https://github.com/Rudd-O/qubes-pass"
license=('GPLv3')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make)

source=(https://github.com/Rudd-O/qubes-pass/archive/v${pkgver}.tar.gz)
sha256sums=('cc481bde42f58828544ae72c1356402c2e0e79d5f6b86f046c81151ce4c16a0d')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${_srcname}/"
    make install-client DESTDIR="$pkgdir"
}

