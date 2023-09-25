# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=nano-backup
pkgver=0.6.0
pkgrel=1
pkgdesc="Precise and minimal file tracker"
url="https://github.com/AlxHnr/nano-backup"
arch=('x86_64')
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('0e3439c06a61e27581ab6fa63e36ce84')


build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"
  install -D build/nb ${pkgdir}/usr/bin/nb
  install -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D nb.1 ${pkgdir}/usr/share/man/man1/nb.1
}
