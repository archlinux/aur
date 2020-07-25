# Maintainer: Austin Sojka <contact@romansixvigaming.com>

pkgname=snake-monogame-bin
_pkgname=snake-monogame
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern take on the classic Snake game. Created using MonoGame."
arch=('x86_64')
url="https://romansixvigaming.com/snake"
license=('custom: commercial')
provides=('snake-monogame')
conflicts=('snake-monogame')
options=('!strip')
source=(snake_${pkgver}.tar.gz::https://github.com/Romans-I-XVI/MonoGame-Snake/releases/download/${pkgver}.Linux/Snake.tar.xz
               ${_pkgname}.desktop)
sha256sums=('3a00f4a6441b93ba6f97a3682358d91f4689148751f2619670e35e26bb215e7a'
            'fc93ad81f52c9ab50814e6cb8bad4c002af051fd6009c8a2b705706bb3d88705')
package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -m644 "${srcdir}/Icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cp "${srcdir}/Snake" "${pkgdir}/opt/${_pkgname}"
  ln -s /opt/${_pkgname}/Snake "${pkgdir}"/usr/bin/snake-monogame
}
