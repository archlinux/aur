# Maintainer: xeptore < xeptore >
_pkgname="hugo"
pkgname=gohugo-extended-bin
pkgver=0.115.3
pkgrel=2
pkgdesc="Extended version of Hugo"
arch=('x86_64' 'aarch64')
url="https://gohugo.io/"
license=('Apache 2.0')
conflicts=('hugo' 'hugo-git' 'hugo-extended-cli')
provides=("${_pkgname}")
source_x86_64=("https://github.com/gohugoio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_extended_${pkgver}_linux-amd64.tar.gz")
source_aarch64=("https://github.com/gohugoio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_extended_${pkgver}_linux-arm64.tar.gz")
md5sums_x86_64=("SKIP")
md5sums_aarch64=("SKIP")

pkgver() {
  curl "https://api.github.com/repos/gohugoio/hugo/releases/latest" 2>/dev/null | sed -n 's/^\s*"tag_name"\s*:\s*"v\([[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\)"\s*,\s*$/\1/p'
}

package() {
  cd "${srcdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
