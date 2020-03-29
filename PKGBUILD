# Maintainer: John K. Luebs <jkl at johnluebs dot tld>

pkgname=gitea-tea
_pkgname=tea
pkgver=0.2.0
pkgrel=1
pkgdesc="Painless self-hosted Git service.."
arch=(x86_64)
url="https://gitea.io"
license=(MIT)
makedepends=(go-pie)
_tag=12f38c892f5d34ea58edd6fda15e7f0691d8d7cd
source=("git+https://gitea.com/gitea/tea.git#tag=${_tag}")
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
