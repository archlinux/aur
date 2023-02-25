# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=0.4.1

_binname=totp

pkgname=rustotpony
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
provides=('totp')
conflicts=('rustotpony-bin')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/zebradil/${pkgname}"
license=('MIT')
# depends=('libx11' 'libxkbfile')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}::https://github.com/zebradil/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b513d1404ee58bc10196b68a46ad2a5117a15bff45edc4e2565965a3dde87970')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
