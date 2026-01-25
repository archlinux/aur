# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wgcf-cli"
pkgname="${_pkgname}-bin"
pkgver=0.3.6
pkgrel=1
pkgdesc="A command-line tool for Cloudflare-WARP API, built using Cobra"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/ArchiveNetwork/${_pkgname}"
license=(
  'MPL-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.zstd::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v8a.tar.zstd"
)
source_armv7h=(
  "${_pkgsrc}-armv7h.tar.zstd::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm32-v7a.tar.zstd"
)
source_i686=(
  "${_pkgsrc}-i686.tar.zstd::${url}/releases/download/v${pkgver}/${_pkgname}-linux-32.tar.zstd"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.zstd::${url}/releases/download/v${pkgver}/${_pkgname}-linux-64.tar.zstd"
)
sha256sums_aarch64=('547c6e82653f2f5d639e0080ceecdcf251bf9a30afb349828c5c25eb6db0b8b6')
sha256sums_armv7h=('ad6c6c8becc0ce38f25a77344333d370d2fe5dc9b154994c41c54ff5689bc964')
sha256sums_i686=('773eb615009bb8921169dac409ba6490d6d7e8217d26622add64385ff270fc54')
sha256sums_x86_64=('d5119d9c9832572c6fda7b3c973334c4d2a3bc9346944e06e4708bdb7e14a58d')
sha512sums_aarch64=('2930cdf9a218c48e45ac532d92d4e508911bb0b4c0718c7d4d483f138a931a8a8e879530fa99f53c983d1d68bc3bd2ba7d9032d4dc2b79789b15faff20c4a59e')
sha512sums_armv7h=('9af0d2794031d818d7fd56e7f178f9d3d498b59b684b08a783b62c3fcfb7f820c4e3a3a425f3ccdd4e123e3521e37c6510d819cede27749e2bd9b80b2513e88a')
sha512sums_i686=('6981b9da4abdd553e132d2a5b364f6cf452b2852c0f510939c56a78441abd162d3cc425ea4e84661ad1a3f5d69db010765dfcafe4f2388d980a726862fc15fc7')
sha512sums_x86_64=('d157c53e367c53a17f4e1741cef81bc478e04d7e380cae2a144aa133c9bee40d0490b559bc1078056ee412d56bc8aa5087cb51453abb22da440e96bcb5e7840a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
