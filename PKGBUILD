# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Cameron Nemo <camerontnorman@gmail.com>

pkgname=brillo
pkgver=1.4.10
pkgrel=2
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
depends=('gcc-libs')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('33eac5dde827fd1e293f6b9c8e0bdd3e5d90f9d7868cdc75f8be8ae4a43e4529')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make install install.apparmor install.polkit DESTDIR="${pkgdir}/"
}
