# Maintainer:  Cameron Nemo <camerontnorman@gmail.com>
pkgname=brillo
pkgver=1.3.0
pkgrel=1
pkgdesc='Keyboard and Backlight LED Control Tool'
arch=('i686' 'x86_64')
url="https://gitlab.com/cameronnemo/brillo"
license=('GPL3')
makedepends=('go-md2man')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/brillo-v${pkgver}.tar.gz")
sha256sums=('daa5a3a18d561b0a150926cb6d2321d3929ad8b6b4dc2bcbd116b98f22b1b876')

build() {
  cd "${srcdir}/brillo-v${pkgver}"
  make dist
}

package() {
  cd "${srcdir}/brillo-v${pkgver}"
  make DESTDIR="${pkgdir}/" install-dist
}
