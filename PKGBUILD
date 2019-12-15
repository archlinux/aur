# Maintainer: German Lashevich <german.lashevich@gmail.com>

_binname=totp

pkgname=rustotpony
pkgver=0.2.6
pkgrel=1
pkgdesc='RusTOTPony — CLI manager of one-time password generators aka Google Authenticator'
provides=('totp')
conflicts=('rustotpony-git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/zebradil/${pkgname}"
license=('MIT')
# depends=('libx11' 'libxkbfile')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}::https://github.com/zebradil/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('4a4634ea51ad9b40de09763f532087bfb9b0e142')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
}
