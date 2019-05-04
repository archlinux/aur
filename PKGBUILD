# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.4.8
pkgrel=1
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('make' 'go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('80ac14284439644b2775821368480167b4d84cd033e771db31edc6dfa1f70194')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make install install.apparmor install.polkit DESTDIR="${pkgdir}/"
}
