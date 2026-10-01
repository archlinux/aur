# Maintainer: robertfoster
pkgname=reposync-zextras
pkgver=0.13.2 # renovate: datasource=github-tags depName=Zextras/reposync
pkgrel=1
pkgdesc="Mirrors Debian and RedHat repositories to an AWS S3 bucket (with Cloudfront support) or a local directory"
arch=('x86_64')
url="https://github.com/Zextras/reposync"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('cargo')
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)

build() {
  cd "reposync-${pkgver}"

  cargo build --release
}

package() {
  cd "reposync-${pkgver}"
  install -Dm755 "target/release/reposync" \
    "${pkgdir}/usr/bin/reposync"
}

sha256sums=('3f769b892dc25b9338a2651e21856d09dba9688a7d83d8cb142e45d9492b5c24')
