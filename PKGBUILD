# Maintainer: Matthew Sexton <matthew@asylumtech.com>

pkgname=gocloc
pkgver=0.7.0
pkgrel=1
pkgdesc="A little fast cloc(Count Lines Of Code)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/hhatto/gocloc"
license=(MIT)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhatto/gocloc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9375f6699a7bffad42da661b4ba7988af23dd01191da4a4b21eca8f9bb676d9a')



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
