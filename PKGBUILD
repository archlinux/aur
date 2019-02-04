# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=lsd
pkgname=lsdeluxe
pkgver=0.12.0
pkgrel=1
pkgdesc="A ls command with a lot of pretty colors."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Peltoche/lsd"
license=('Apache')
makedepends=('rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/Peltoche/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9b9a05452c23ccc94676e2e6b86f57805262496b14b6ec018df08996131eeec5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -m 755 -D "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
