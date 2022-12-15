# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Cameron Nemo <cam@nohom.org>

pkgname=brillo
pkgver=1.4.11
pkgrel=2
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
depends=('gcc-libs')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('74c155e0435c148eb9c0b08a4d2dfcac8f7e33fc22dd1fde7275099b8e93f428')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make install install.apparmor install.polkit DESTDIR="${pkgdir}/"
}
