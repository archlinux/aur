# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=teseq
pkgver=1.1.1
pkgrel=1
pkgdesc='A tool for analyzing files that contain control characters and terminal control sequences'
arch=('x86_64')
url='https://www.gnu.org/software/teseq/'
license=('GPL3')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('230d2b4a587542284c415b33557a27774f5ad1580ed9db272bcd1e2034ea0589')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
