# Maintainer: robertfoster
pkgname=reposync-zextras
pkgver=0.9.1
pkgrel=1
pkgdesc="Mirrors Debian and RedHat repositories to an AWS S3 bucket (with Cloudfront support) or a local directory"
arch=('x86_64')
url="https://github.com/Zextras/reposync"
license=('AGPL3')
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

sha256sums=('661efd17e88a655f71f4c0e83256b73e9f0f894b56fc6966c6139f9c3bd85648')
