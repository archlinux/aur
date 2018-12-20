# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsdeluxe
pkgver=0.11.0
pkgrel=1
pkgdesc="A ls command with a lot of pretty colors."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Peltoche/lsd"
license=('Apache')
makedepends=('rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/Peltoche/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ff9e4b36aa9f3457e978ecd01aa889010b70cecee73a5dfaad77b388c17e4c0e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -m 755 -D "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
