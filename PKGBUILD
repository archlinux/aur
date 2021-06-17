# Maintainer: John K. Luebs <jkl at johnluebs dot tld>

pkgname=gitea-tea
_pkgname=tea
pkgver=0.7.0
pkgrel=1
pkgdesc="Painless self-hosted Git service.."
arch=(x86_64)
url="https://gitea.io"
license=(MIT)
makedepends=(go-pie)
source=(https://gitea.com/gitea/tea/archive/v${pkgver}.tar.gz)
sha256sums=('0d65b49410321535ffcbba7795651cbef81911552f12f7617c9cf77a9d7d5da9')

build() {
  cd ${_pkgname}
  make TEA_VERSION=v${pkgver}
}

package() {
  cd ${_pkgname}

  install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm755 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
