# Maintainer: r4v3n6101 <raven6107@gmail.com>

pkgname=hlbsp
pkgver=0.4.7
pkgrel=2
pkgdesc="Half-Life's .BSP maps viewer."
arch=('any')
url="https://github.com/r4v3n6101/hlbsp"
license=('GPL')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/r4v3n6101/hlbsp#tag=v${pkgver}")
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
