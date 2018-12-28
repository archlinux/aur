# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=GoogleContainerTools
_upstream_pkgname=skaffold
pkgname=skaffold-bin
pkgver=0.20.0
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
  # "${_doc_html}::https://storage.googleapis.com/${_upstream_pkgname}/releases/v${pkgver}/docs/index.html"
  # "${_doc_pdf}::https://storage.googleapis.com/${_upstream_pkgname}/releases/v${pkgver}/docs/index.pdf"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=(
  "c829abdd3273107f98432f2aa77bd58192b48485a125ac2e6732fb52760ce4e3"
  # "932bb93b9d321d1e3dc974d171cea360a04f2e233d3bc759a32cc34859296285"
  # "8645efc4d2da7d6a0aeb23b2bc81d069bfd490e06ff78df82aab13a36e1ab85a"
  "43a2aa523a99dddb6c131e67e11334493e64c67f03b0d8f6745b6b3f34157d65"
)

package() {

  install -Dm755 "${srcdir}/${_upstream_pkgname}-${_goos}-${_goarch}" "${pkgdir}/usr/bin/${_upstream_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}/LICENSE"

  # install -Dm644 "${srcdir}/${_doc_html}" "${pkgdir}/usr/share/doc/${_upstream_pkgname}/html/${_doc_html}"
  # install -Dm644 "${srcdir}/${_doc_pdf}" "${pkgdir}/usr/share/doc/${_upstream_pkgname}/pdf/${_doc_pdf}"
}
