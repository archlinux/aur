# Maintainer: kpcyrd <git@rxv.cc>

pkgname=narnia
pkgver=0.1.0
pkgrel=1
pkgdesc="Multiprocess sandboxed webhook daemon"
url="https://github.com/kpcyrd/narnia"
depends=('gcc-libs' 'libseccomp')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4af37ba49f5ff0181bdfc9a1f6e4c893fbefbf80fe01b31eb292152b95c0d61e457dc9b03f1ada320069176875ed3b769aa718fae4a7a137df29aa57eb75a972')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
