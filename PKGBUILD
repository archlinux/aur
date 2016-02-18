# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=termpix
pkgver=0.0.1
pkgrel=1
pkgdesc="Draw images on an ANSI terminal"
arch=('i686' 'x86_64')
url="https://github.com/hopey-dishwasher/termpix"
license=('Apache')
depends=('rust')
makedepends=('cargo')
source=("https://github.com/hopey-dishwasher/termpix/archive/v${pkgver}.tar.gz")
sha256sums=('45d8c88263495908f130399666c7a7af95f4ac4d17a8483c5ba0aa69e10a8c65')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: set ts=2 sw=2 ft=sh noet:
