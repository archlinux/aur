# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-bin"
pkgver=1.5.0
pkgrel=2
pkgdesc="A lightweight generic purpose file watcher"
arch=(
  'x86_64'
)
url="https://github.com/cristianoliveira/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('915cf73aad93ba3ae5add4e76803b030c1de18c4e93afe37a3eadb9737c22da5'
            '06d192e34ed1d62acb191604c71067f6b40bda375e44f92b953bdb0ad7c524db')
sha256sums_x86_64=('6ffce42e64b8c0a3da272eb654ba82273e045454d5f3d3c8e4633840e470a6b9')

package() {
  cd "${srcdir}"
  install -vDm755 "pkg/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -s "${_pkgname}" "${pkgdir}/usr/bin/fzz"
}
