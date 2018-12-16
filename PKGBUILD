# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsdeluxe
pkgver=0.10.0
pkgrel=1
pkgdesc="A ls command with a lot of pretty colors."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Peltoche/lsd"
license=('Apache')
makedepends=('rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/Peltoche/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6e1880306d61e778bd9746ad99e5814980b8eb7c4e708ef0e156bab509dc8682')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -m 755 -D "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
