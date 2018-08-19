# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.2.1
pkgrel=1
pkgdesc='Keyboard and Backlight LED Control Tool'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('help2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('08507fccd745b0c371dec33944182f4f11bd637c8b6d49d8d28e702f4c271834')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make dist
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make DESTDIR="${pkgdir}/" install-dist
}
