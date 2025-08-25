# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="plexdrive"
pkgname="${_pkgname}-bin"
pkgver=5.2.1
pkgrel=1
pkgdesc="Mounts your Google Drive FUSE filesystem (optimized for media playback)"
arch=(
  'aarch64'
  'armv5h'
  'armv6h'
  'armv7h'
  'i686'
  'powerpc64'
  'powerpc64le'
  'x86_64'
)
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-TUTORIAL.md::${url}/raw/refs/tags/${pkgver}/TUTORIAL.md"
        "${_pkgsrc}-LICENSE.md::${url}/raw/refs/tags/${pkgver}/LICENSE.md")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm64")
source_armv5h=("${_pkgsrc}-armv5h::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm5")
source_armv6h=("${_pkgsrc}-armv6h::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm6")
source_armv7h=("${_pkgsrc}-armv7h::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm7")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/${pkgver}/${_pkgname}-linux-386")
source_powerpc64=("${_pkgsrc}-powerpc64::${url}/releases/download/${pkgver}/${_pkgname}-linux-ppc64")
source_powerpc64le=("${_pkgsrc}-powerpc64le::${url}/releases/download/${pkgver}/${_pkgname}-linux-ppc64le")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('50687dd1457e1883c3abd06ecfd6af3d2750e54cecfc16d2449b67fd7d838ce3'
            '4b05b2e3b4c90bbf850566bc5f2ac485d5597c018ec0bd3b7664a50ec1f27caa'
            '1be52acefe73a0dfdce84fca0c9a1f343a49ec2c1d805af913fe004f6742b227')
sha256sums_aarch64=('33152e0a03552303d8312c5710c74097ff1d3bdd490824db7c09d4be556079ad')
sha256sums_armv5h=('6eb53aa1ae1680f8b3618ab64d56d2b4753d06e18c50d41a0cf4d7555f5a07c6')
sha256sums_armv6h=('b0eb8fab1cbe0b5d73bc8b2292722777dfeeef52be66f78df4354b81911f0739')
sha256sums_armv7h=('031b29f4928cf2da69c14ad3c3e0565cdc5be6c59ec37378504d36e02d5d9f67')
sha256sums_i686=('259e8e84eadbe9bc9a906bcdf50492f321843a8590b30203a73dbb4b643c5e47')
sha256sums_powerpc64=('90b21c337ac2808934cef7b48c00d1ec6ad7326d0cd0c3890250974afd78402e')
sha256sums_powerpc64le=('bcd30ab2102268e307a176fe4302c71b7b00d51a2152648e5a033d56018ce335')
sha256sums_x86_64=('bc4efaf7c90b3c54f8163ee692c1db26fd6b7c08c19c7653f813af6fd1a0cc1f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-TUTORIAL.md" "${pkgdir}/usr/share/doc/${_pkgname}/TUTORIAL.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
