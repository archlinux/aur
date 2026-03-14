# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="grafterm"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=2
pkgdesc="Metrics dashboards on terminal (a grafana inspired terminal version)"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/slok/${_pkgname}"
license=(
  'Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/Readme.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64"
)
source_armv7h=(
  "${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-v7"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('9b8de3e379e139a1ef970306fb85de30adea2dc25bcae542d0391ddb8fd7a133'
            'c8a470b0836965d56afecdbe207bfb78789dc99137a5c441de5274d953457471')
sha256sums_aarch64=('b6e97b0b73b60ac8d36d5580384b8a706af0ba6bd0ae198a28980849b045ffa5')
sha256sums_armv7h=('45d3ed9fd78a7c294c2f44fe53919748b5b02c4e44ad1ea0e5f430133e2b4a92')
sha256sums_x86_64=('9ce9a95394a5c53bab322421ef1cde8df1badc589c71baee4fece7b5ecd03bbe')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm755 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
