# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wipemychat"
pkgname="${_pkgname}-bin"
pkgver=1.2.2
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENCE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('94688aa50664745dbc71e7cc5f7b22fa189b130a15ae654944aecf8763ce023c')
sha256sums_aarch64=('38cd754d96d568ad556cdcbca57627c4c528831eaf3e64d166a1f0b19123a300')
sha256sums_i686=('456700516ba656530f3535ca728045f4c7edbc351fee798e2c61516092c5b780')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
