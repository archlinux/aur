# Maintainer:  Evaggelos Balaskas <evaggelos[at]balaskas[dot]gr>
# Contributor: Evaggelos Balaskas <evaggelos[at]balaskas[dot]gr>

pkgname=smtpping
pkgver=1.1.4
pkgrel=1
pkgdesc="A simple, portable tool for measuring SMTP server delay, delay variation and throughput."
arch=("x86_64")
url="https://github.com/halon/smtpping"
license=('GPL2')
depends=()
makedepends=('cmake')

source=("https://github.com/halon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('beca8c44133b91ebe9fdfd044d8dee0947aa7683cba7b0e509ce15cda8fef74a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
