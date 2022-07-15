# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=neatmail
pkgver=02
pkgrel=2
pkgdesc="A command-line mail client."
arch=('i686' 'x86_64' 'aarch64')
url="https://repo.or.cz/neatmail.git"
license=('ISC')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aligrudi/neatmail/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a6c8631f61967bce873bce6dc7891acea3e737aa4312632a213a350b2e5b141e')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 mail ${pkgdir}/usr/bin/neatmail
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname%-*}/README
}

