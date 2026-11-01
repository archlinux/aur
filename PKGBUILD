# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: ycna07 <aozakitouko at foxmail dot com>

pkgname=git-cc
pkgver=0.2.8_rc0
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="a git extension to help write conventional commits"
arch=('x86_64' 'aarch64')
url="https://github.com/Skalt/${pkgname}"
license=('PolyForm-Noncommercial-1.0.0' 'LicenseRef-PolyForm-Free-Trial-1.0.0')
depends=('glibc')
makedepends=('go')
provides=("${pkgname}")
options=('!debug')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('6db74983bdc26719620c3f5b2f1ce28a0c354582a4b3858f49a811445a544e8e')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"
  go build
}

package() {
  cd "${pkgname}-${_pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
  
  install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

