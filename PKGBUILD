# Maintainer: deadc0de6 <info@deadc0de.ch>

pkgname=dotdropx
pkgver=0.0.1
pkgrel=1
pkgdesc="Addon script for dotdrop"
arch=('any')
url="https://github.com/jtyers/dotdropx"
license=('MIT')
groups=()
depends=('dotdrop' 'yq')
makedepends=('git')
source=("git+https://github.com/jtyers/dotdropx.git#tag=v${pkgver}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --abbrev=0 --tags | sed 's/^v//g'
}

package() {
  cd "${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}/dotdropx" "${pkgdir}/usr/bin/${pkgname}"
}

