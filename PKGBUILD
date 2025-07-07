# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=nekoray-mahdi-zarei-bin
_pkgname=${pkgname//-mahdi-zarei-bin/}
pkgver=4.3.6
pkgrel=1
_releasedate=2025-07-07
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box) - Mahdi-zarei fork"
arch=('x86_64')
url="https://github.com/Mahdi-zarei/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-wayland' 'qt6-charts')
conflicts=('nekoray' 'nekoray-git' 'nekoray-bin')
options=(!debug)

source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_releasedate}-linux64.zip"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)

sha256sums=('3c16f850a94f65dd5fef91e43af4b24875dd4737248a35713d23c065c5e21173'
            'fcc65aa60bd743aac9601edb0f2f6da1e9a84612dd8fd9e17cb16995746ef96a'
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

