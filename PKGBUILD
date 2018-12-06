# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.4.3
pkgrel=1
pkgdesc='Control the brightness of backlight and keyboard LED devices'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('367ece2beb5d7980e139512f24c6134e8a5f4f86dcf8a0d9a494fa0a18dc6c8c')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make dist
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make DESTDIR="${pkgdir}/" install-dist
}
