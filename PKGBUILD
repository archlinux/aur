# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://docs.projectdiscovery.io/tools/cloudlist"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('52b0b776023dae4079d1ae2633a724f2949f35f39137800a00c5bc9d45430870')
sha256sums_armv7h=('ea58256bfc99d90fdc45afb36c9af62fc85548a200401da1fb38c4edeadd5c7c')
sha256sums_i686=('7872eb3d2004905a57531abaf777dbbd49694d9f1f86cf9a95c2dc65bb47d603')
sha256sums_x86_64=('5bd58f5c3df8f730ea57219627e4970378dde2ca067185278812a4c75b958578')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md"  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
