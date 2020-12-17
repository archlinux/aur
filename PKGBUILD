# Maintainer: John K. Luebs <jkl at johnluebs dot tld>

pkgname=gitea-tea
_pkgname=tea
pkgver=0.6.0
pkgrel=2
pkgdesc="Painless self-hosted Git service.."
arch=(x86_64)
url="https://gitea.io"
license=(MIT)
makedepends=(go-pie)
source=(https://gitea.com/gitea/tea/archive/v${pkgver}.tar.gz)
sha256sums=('048e6235885bec6a45ca22fba95b163d1d64b683f2f41c9c6339aacc7541f869')

build() {
  cd ${_pkgname}
  make TEA_VERSION=v${pkgver}
}

package() {
  cd ${_pkgname}

  install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm755 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
