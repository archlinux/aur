# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vapoursynth-plugin-zsmooth"
pkgname="${_pkgname}-bin"
pkgver=0.19.0
pkgrel=1
pkgdesc="Zsmooth plugin for VapourSynth"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/adworacz/zsmooth"
license=(
  'MIT'
)
depends=(
  'glibc'
  'vapoursynth'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64-linux-gnu.zip::${url}/releases/download/${pkgver}/zsmooth-aarch64-linux-gnu.zip"
)
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64-linux-gnu.zip::${url}/releases/download/${pkgver}/zsmooth-x86_64-linux-gnu.zip"
)
sha256sums=('3629754f6d28beebf46605ed93489ab77a498b040270a3c0065e2d9637ddd6ec'
            '4e8049adeaf266a580ff8738729a568465fded9a1bdf25396f234d2b8b07552f')
sha256sums_aarch64=('d2c98451f969096589c727d06e8f2a779cbc8b30c0f356419a15dad403262cab')
sha256sums_x86_64=('c9559367f4bdaf8cc3408cc8271e438c516196b5edea4305a69ded3e2d748dae')

package() {
  cd "${srcdir}"
	install -vDm755 "lib${_pkgname##*-}.so" -t "${pkgdir}/usr/lib/vapoursynth"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
