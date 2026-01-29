# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scip-zig"
pkgname="${_pkgname}-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="SCIP indexer for Zig. Experimental."
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/zigtools/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-linux.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux.zip"
)
sha256sums_aarch64=('01938bb118da612318e792abc6bdeebc5911a369b131ac52232b59d306a7d9ee')
sha256sums_x86_64=('7c144f13691b37eb7a0b7d8953038fdc494c994702d87c3209bfb79f56bcf444')

package() {
  cd "${srcdir}"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
