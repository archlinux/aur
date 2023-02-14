# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=0.4.0

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
sha256sums=('929eee7e8b3c7a8abfb4fb5aef70743ba6073feb288b0f508d1f6f078d95b0a9')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
