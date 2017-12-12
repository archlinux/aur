# Maintainer:  Evaggelos Balaskas <evaggelos[at]balaskas[dot]gr>
# Contributor: Evaggelos Balaskas <evaggelos[at]balaskas[dot]gr>

pkgname=smtpping
pkgver=1.1.3
pkgrel=1
pkgdesc="A simple, portable tool for measuring SMTP server delay, delay variation and throughput."
arch=("x86_64")
url="https://github.com/halon/smtpping"
license=('GPL2')
depends=()
makedepends=('cmake')

source=("https://github.com/halon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bd2ca014d8bda46398ad65dc5429ab43de785658214d3b73bb5a879433210707')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
