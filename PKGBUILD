# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-local-registry
pkgver=0.1.6
pkgrel=1
pkgdesc="A cargo subcommand to manage local registries"
url="https://github.com/alexcrichton/cargo-local-registry"
depends=('cargo' 'http-parser' 'curl')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexcrichton/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('df7e1cef9d6332f3b3380a0a15036463c0821a35b1302b13367d08879b7859d70ec82eaa904d4e94a765fa1694034455dbecb6c0ada35e8e0a9853478ce5d577')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
