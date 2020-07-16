# Maintainer: John K. Luebs <jkl at johnluebs dot tld>

pkgname=gitea-tea
_pkgname=tea
pkgver=0.3.1
pkgrel=1
pkgdesc="Painless self-hosted Git service.."
arch=(x86_64)
url="https://gitea.io"
license=(MIT)
makedepends=(go-pie)
source=("git+https://gitea.com/gitea/tea.git#tag=v${pkgver}")
sha256sums=(SKIP)

build() {
  cd ${_pkgname}
  go build -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" .
}

package() {
  cd ${_pkgname}

  install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm755 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
