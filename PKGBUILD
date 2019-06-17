# Maintainer: Zeger-Jan van de Weg <git@zjvandeweg.nl> -> https://gitlab.com/zj

pkgname=snippet
pkgver=0.4.0
pkgrel=0
pkgdesc='A terminal based interface to create a new GitLab snippet'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://gitlab.com/zj/snippet"
license=(MIT)
provides=(snippet)
conflicts=(snippet)
makedepends=("go" "git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('58b1067ab6382240cb7bc34fdef494b6f1e6f75e98bc42905ae86acc6a2201d4')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  GO111MODULE=on go build -mod=vendor
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/snippet "${pkgdir}"/usr/bin/snippet
}
