# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Cameron Nemo <cam@nohom.org>

pkgname=brillo
pkgver=1.4.13
pkgrel=1
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('a08cc8279449f474f8124b8aeb76b34a10e89489853be5280d1476616769b260')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make install install.apparmor install.polkit DESTDIR="${pkgdir}/"
}
