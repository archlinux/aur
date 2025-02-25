# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=nekoray-mahdi-zarei-bin
_pkgname=${pkgname//-mahdi-zarei-bin/}
pkgver=4.2.10
pkgrel=1
_releasedate=2025-02-25
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box) - Mahdi-zarei fork"
arch=('x86_64')
url="https://github.com/Mahdi-zarei/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base')
conflicts=('nekoray' 'nekoray-git' 'nekoray-bin')

source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_releasedate}-linux64.zip"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)

sha256sums=('02fb1b863ec15ae40048b60222ed13f0d58a9d5c99f01d5d96bfa590a40e1118'
            '1d2fb122bc4a2ce526b923e25731071e6e3c5016f0796ea08fc2ac13cd0c1356'
            '5a7cbb61608137924fb1ba3ecb057adb7973f5775f64758736b447041fa15377')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/${_pkgname}/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

  install -Dt ${pkgdir}/usr/lib/${_pkgname}/ -m755 ./${_pkgname}/nekobox_core
  install -Dt ${pkgdir}/usr/lib/${_pkgname}/ -m755 ./${_pkgname}/nekoray
  install -Dm755 ./${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}

  install -Dt ${pkgdir}/usr/share/applications/ -m644 ./${_pkgname}.desktop
  install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./${_pkgname}/nekobox.png
}

