# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hack-browser-data"
pkgname="${_pkgname}-bin"
pkgver=0.4.6
pkgrel=1
pkgdesc="Extract and decrypt browser data, supporting multiple data types"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/moonD4rk/HackBrowserData"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-64bit.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-32bit.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.zip")
b2sums_x86_64=('9b8b9b8830aeb97ef8ace8e3521a36d58fbd74e99768eeefb5ac15116609545f989f87d8953c455b8ffa80f331ab4a6eafcde535d87c2b62b798e0e2816e5a22')
b2sums_aarch64=('dc8380985f05cf9072811f8256839bf4b5d8423a7209c56e4f343aac75f9ca6e841241c563d9c392b469c515d5cfe66339bdae12cf3d333465b1ba49800205c3')
b2sums_i686=('d9d024bb9a343b4c30f606f325a32671a82aac91f472083196cc80ca7ac52b3220b8eeca1ea6ff1aab0229ad93cd75942d104373b0d52c2cb06f75ced8549399')
b2sums_armv7h=('9e0048dc1c9336610c87277af37a2a1b82eecaedf5dccbecaab4aa59694696411ff4a3ceb7a1bc3cee606445e6cef2648f27d67e4ee5f062fa13fb97cbaca3e4')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "README_ZH.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
