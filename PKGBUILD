# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Cameron Nemo <cam@nohom.org>

pkgname=brillo
pkgver=1.4.12
pkgrel=1
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
depends=('gcc-libs')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('5002e5f4a68f7d8df6ce0c1b41f84e4bc4da3e968c488282289aed1364c4a951')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make install install.apparmor install.polkit DESTDIR="${pkgdir}/"
}
