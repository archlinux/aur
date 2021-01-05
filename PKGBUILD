# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
_githash="c0d6b273ad5b2ec8e06283dee150c01ae7206837"
pkgname="${_pkgname}-bin"
pkgver=26
pkgrel=1
pkgdesc="A cross-platform synthesizer patch editor library"
arch=('i686' 'x86_64')
url="https://github.com/eclab/edisyn/"
license=('Apache')
depends=('java-runtime>=11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.jar::https://cs.gmu.edu/~eclab/projects/${_pkgname}/${_pkgname}.jar"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.jar")
md5sums=('57deace01f048365260a15ef0eee1b46'
         '5022b2d274e99ca6704f4dd69e17a1cb'
         'a6f1544c7b08354593f2c5b91258d88c')

package() {
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.jar"
  install -Dm755 "${srcdir}/${_pkgname}.sh" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
