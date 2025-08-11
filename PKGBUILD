pkgname=gnu-hello
pkgver=2.9
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Testing submission to AUR"
url="https://mirrors.nju.edu.cn/gnu/hello/"
source=("${url}/hello-${pkgver}.tar.gz")
sha256sums=('ecbb7a2214196c57ff9340aa71458e1559abd38f6d8d169666846935df191ea7')

build() {
  cd "${srcdir}/hello-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/hello-${pkgver}"
  make DESTDIR="$pkgdir" install
}
