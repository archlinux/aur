# Maintainer: Samuel Bernardo <samuel at lip dot pt>

pkgbase=oidc-agent
pkgname=('oidc-agent')
pkgver=3.3.5
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
license=('MIT')
url='https://github.com/indigo-dc/oidc-agent'
makedepends=('help2man'
             'libcurl-openssl-1.0')
depends=('libmicrohttpd'
         'libseccomp'
         'libsecret'
         'libsodium'
         'curl')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/LIP-Computing/oidc-agent/archive/v${pkgver}_so.tar.gz)
sha256sums=('8ef20b1614f7607fb4f708b6f0b5ef878c938889a49b009da03a180779c75efc')

build() {
  cd "$srcdir"/${pkgbase}-${pkgver}_so
  make
}

package() {
  cd "$srcdir"/${pkgbase}-${pkgver}_so
  make install_lib PREFIX="$pkgdir"
  make install PREFIX="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
