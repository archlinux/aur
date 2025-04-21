# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor: mickaelca <contact@mickael-caudrelier.fr>
pkgname=helmify-bin
pkgver=0.4.18
pkgrel=2
pkgdesc="Creates Helm chart from Kubernetes yaml"
provides=('helmify')
conflicts=("helmify")
arch=('x86_64')
url="https://github.com/arttor/helmify"
license=("MIT")
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/arttor/helmify/releases/download/v${pkgver}/helmify_Linux_x86_64.tar.gz
    # TODO provide a package that is built on the user's system
    $pkgname-$pkgver-source.tar.gz::https://github.com/arttor/helmify/archive/refs/tags/v0.4.18.tar.gz
)
sha512sums=(
    "e788c631634eef60d6c6a3c901f4cb7de7708597556469c611c41df96f6fcb00919b076ee0742ce51d289ac6efcf3a65e7f4b1455986ba4319f3e4996b9d7565"
    "5b37ec3e92a4b98a33b2190fe417f3a12d7842d3951e589ad82707e3b21510d32bb5cfdf38b41f6a483eef184f5de74f48b803b1a004d906d1dcfd1ecf804243"
)

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "${srcdir}/${provides}" "${pkgdir}/usr/bin/${provides}"
  install -Dm644 "${srcdir}/${provides}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
