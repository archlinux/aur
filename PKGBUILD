# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vapoursynth-plugin-zsmooth"
pkgname="${_pkgname}-bin"
pkgver=0.16.0
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
sha256sums=('54a78e01eff9300a7adb5b370f3c60afbe601c03cb4ed61aac94a5e335e22b61'
            '4e8049adeaf266a580ff8738729a568465fded9a1bdf25396f234d2b8b07552f')
sha256sums_aarch64=('9d9fe5bb7869cef8edbe1f53e9277b47efbef4af6f1ac3bd07861e9676f7bbee')
sha256sums_x86_64=('09a9edd166c1458685b87939348ca4b60ace25f698315109ec2d95b92c8e1b0b')

package() {
  cd "${srcdir}"
	install -vDm755 "lib${_pkgname##*-}.so" -t "${pkgdir}/usr/lib/vapoursynth"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
