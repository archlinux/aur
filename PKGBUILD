# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=git-cc
pkgver=0.2.6
pkgrel=1
pkgdesc="a git extension to help write conventional commits"
arch=('x86_64' 'aarch64')
url="https://github.com/Skalt/${pkgname}"
license=('PolyForm-Noncommercial-1.0.0' 'LicenseRef-PolyForm-Free-Trial-1.0.0')
depends=(
  'glibc'
  )
makedepends=('go')
provides=("${pkgname}")
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91888a0adb2bc6c4e26b3a95fff239732bec109d8dbe5a04cad81716eb63f15b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
}

package() {
  ls -alh
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"


  install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
