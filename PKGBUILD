# Maintainer: Danilo Carolino <danilogcarolino@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output
pkgver=2.6.1
pkgrel=21
pkgdesc="Colors for Docker CLI"
arch=('x86_64')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname}"
source=("docker-color-output::https://github.com/${_gitauthor}/${pkgname}/releases/download/v${pkgver}/${pkgname}-linux-amd64")
sha512sums=('SKIP')
makedepends=("go" "git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=("!lto")

pkgver() {
  return $pkgver
}

package() {
  install -Dm 755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
