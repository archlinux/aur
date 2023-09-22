# Maintainer: thorko contact@thorko.de
pkgname=promtail-git
pkgver=2.9.1
pkgrel=0
pkgdesc="Promtail - Logshipper for loki"
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
makedepends=('git' 'go' 'make')
source=("${pkgname}::git+https://github.com/grafana/loki.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make PROMTAIL_JOURNAL_ENABLED=true promtail
}

package() {
    install -Dm0755 "$srcdir/$pkgname/clients/cmd/promtail/promtail" "${pkgdir}/usr/bin/promtail"
}
