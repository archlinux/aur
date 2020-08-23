# Maintainer: r4v3n6101 <raven6107@gmail.com>

pkgname=hlbsp
pkgver=0.4.0
pkgrel=1
pkgdesc="Half-Life's .BSP maps viewer."
arch=('any')
url="https://github.com/r4v3n6101/hlbsp"
license=('GPL')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/r4v3n6101/hlbsp")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
