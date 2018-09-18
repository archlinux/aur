# Contributor: Ian Beringer <ian@ianberinger.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=8
pkgrel=1
license=('MIT')
pkgdesc="A terminal file manager inspred by ranger written in Go"
depends=("glibc")
makedepends=('git' 'go-pie')
arch=('i686' 'x86_64')
_gourl='github.com/gokcehan/lf'
url="https://${_gourl}"
source=("$pkgname-r$pkgver.tar.gz::https://github.com/gokcehan/$pkgname/archive/r$pkgver.tar.gz")
sha256sums=('b92bfba41cc1b4054c44bf615907380482c66694fc9eaf4affe185b39cb9bb26')

build() {
  cd ${pkgname}-r$pkgver
  go build
}

package() {
  cd ${pkgname}-r$pkgver
  install -Dm755 lf-r$pkgver "${pkgdir}"/usr/bin/lf
  install -Dm644 ./LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ./README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
