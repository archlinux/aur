# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dockerc"
pkgname="${_pkgname}-bin"
pkgver=0.3.2
pkgrel=1
pkgdesc="Container image to single executable compiler"
arch=('aarch64' 'x86_64')
url="https://github.com/NilsIrl/${_pkgname}"
license=('GPL-3.0-only')
depends=('docker')
depends_x86_64=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_aarch64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_x86-64-gnu")
sha256sums=('4f29a597b2c933d723a2048ed6b051c66e961e4861397797a0775705ebd25764'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_aarch64=('048144cf0205027d5a36ef6c1ef0addc3fa9e6c67919af213fa304159795e1f2')
sha256sums_x86_64=('d2d7c95490fdf4ebd50b921b695f43265ce1c05f425e4ef3eb5e835fbb89d831')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
