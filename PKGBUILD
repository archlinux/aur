# Maintainer: Danilo Carolino <danilogcarolino@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output-git
pkgver=2.2.0
pkgrel=4
pkgdesc="Colors for Docker CLI"
arch=('x86_64')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("${pkgname%-git}.tar.gz::https://github.com/${_gitauthor}/${pkgname%-git}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')
depends=('go')
makedepends=(git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

build() {
  cd "$srcdir/${pkgname%-git}-${pkgver}"
  make
  cp bin/docker-color-output dco
}

package() {
  cd "$srcdir/${pkgname%-git}-${pkgver}"
  install -vDm 755 dco -t "${pkgdir}/usr/bin"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
