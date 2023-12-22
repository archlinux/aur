# Maintainer: Matthew Sexton <mssxtn@gmail.com>

pkgname=gocloc
pkgver=0.5.2
pkgrel=1
pkgdesc="A little fast cloc(Count Lines Of Code)"
arch=(x86_64)
url="https://github.com/hhatto/gocloc"
license=(MIT)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhatto/gocloc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8f95201bc6042767de7059cfd6a2a37799b3bf909ec61029baffe0f6ccc509d')



build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 bin/gocloc -t "${pkgdir}"/usr/bin
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
