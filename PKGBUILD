# Maintainer: Zeger-Jan van de Weg <git@zjvandeweg.nl> -> https://gitlab.com/zj

pkgname=snippet
pkgver=0.3.0
pkgrel=1
pkgdesc='A terminal based interface to create a new GitLab snippet'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://gitlab.com/zj/snippet"
license=(MIT)
provides=(snippet)
conflicts=(snippet)
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e518ba75089a706b57149c99475fbccab51c2fc906c6cc0e6124e370087ab61e')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  GO111MODULE=on go build -mod=vendor
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/snippet "${pkgdir}"/usr/bin/snippet
}
