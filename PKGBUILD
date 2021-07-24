pkgname=konsole-launcher
pkgver=1
pkgrel=1
pkgdesc='Opens new windows in Konsole as quickly as possible'
url='https://github.com/sandsmark/konsole-launcher'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('gcc')
depends=('systemd-libs') # sd-bus
source=("https://github.com/sandsmark/konsole-launcher/archive/${pkgver}.tar.gz")

build() {
    cd konsole-launcher-${pkgver}
    # gnu make and/or gcc are broken
    LDFLAGS+=,--no-as-needed
    make
}

package() {
    cd konsole-launcher-${pkgver}
    make install DESTDIR="${pkgdir}"
}
md5sums=('8fc0e1c398ed7eb103e0eb69ec496eb4')
