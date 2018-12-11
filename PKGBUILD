# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsdeluxe
pkgver=0.8.0
pkgrel=1
pkgdesc="A ls command with a lot of pretty colors."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Peltoche/lsd"
license=('Apache')
makedepends=('rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/Peltoche/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('39013508758d3bf21d7db096bfc6c14092a001cdf6daa73cf63f6606c8e979b8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -m 755 -D "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
