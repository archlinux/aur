# Maintainer: Will Elliott <troutcobbler@gmail.com>

pkgname=goober
pkgver=0.1.1
pkgrel=1
pkgdesc="Workspace module generator for eww."
url='https://bitbucket.org/troutcobbler/goober'
arch=(x86_64)
license=(MIT)
makedepends=(go)
depends=(eww)
source=("git+${url}#tag=${pkgver}")
b2sums=('SKIP')

build() {
  cd "$pkgname"
  go build .
}

package() {
  cd "$pkgname"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/eww
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/eww-wayland
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 doc/eww/* "${pkgdir}/usr/share/doc/${pkgname}/eww"
  install -Dm644 doc/eww-wayland/* "${pkgdir}/usr/share/doc/${pkgname}/eww-wayland"
  install -Dm644 doc/goober.conf "${pkgdir}/usr/share/doc/${pkgname}"
}
