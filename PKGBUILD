# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=GoogleContainerTools
_upstream_pkgname=skaffold
pkgname=skaffold-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications."
arch=('x86_64')
_goos="linux"
_goarch="amd64"
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
license=("Apache")
_doc_html="index.html"
_doc_pdf="index.pdf"
### https://github.com/GoogleContainerTools/skaffold/releases/download/v0.19.0/skaffold-linux-amd64
source=("${_upstream_pkgname}-${_goos}-${_goarch}::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}-linux-${_goarch}"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "e542a668bc1e585b5de66b7460d820ea7cd07bdbd2eb5f5f5c00efa56495e03d"
  "43a2aa523a99dddb6c131e67e11334493e64c67f03b0d8f6745b6b3f34157d65"
)

package() {

  install -Dm755 "${srcdir}/${_upstream_pkgname}-${_goos}-${_goarch}" "${pkgdir}/usr/bin/${_upstream_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"
}
