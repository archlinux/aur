# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.3.1
pkgrel=1
pkgdesc='Backlight and Keyboard LED control tool'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('5dc1ca0b29109daa27759be6aee0dcd05defbf09f4434f0136f13462d5b56792')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make dist
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make DESTDIR="${pkgdir}/" install-dist
}
