# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.4.1
pkgrel=1
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('4d0b1da7b8b21d93f86c796dd5f0c5376686ce484d6bbd7a27bc70520c1276c4')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make dist
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make DESTDIR="${pkgdir}/" install-dist
}
