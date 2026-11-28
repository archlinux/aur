# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gh-issue-sync-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Sync GitHub issues to work with them locally"
arch=('x86_64' 'aarch64')
url="https://github.com/mitsuhiko/gh-issue-sync"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mitsuhiko/gh-issue-sync/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gh-issue-sync-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gh-issue-sync-linux-arm64")
sha256sums=('a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2')
sha256sums_x86_64=('095749599f9d6c81d91765bd16b14d5c76215fd1d3ef6bccf5d005efb2d9b84e')
sha256sums_aarch64=('ca86c002640426b2282cc947a5b34da3e51c91e62423c3996085587110704785')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gh-issue-sync"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
