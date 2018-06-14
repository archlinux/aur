# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
_githash="aa653caa498f8cc9bf582cf77279e2568023ad41"
pkgname="${_pkgname}-bin"
pkgver=13
pkgrel=3
pkgdesc="A cross-platform synthesizer patch editor library"
arch=('i686' 'x86_64')
url="https://github.com/eclab/edisyn/"
license=('Apache')
depends=('java-runtime>=7')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/eclab/edisyn/raw/${_githash}/jar/edisyn.jar"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
md5sums=('c4ef78b127533bbf40325bda77f657f1'
         '5022b2d274e99ca6704f4dd69e17a1cb'
         'a6f1544c7b08354593f2c5b91258d88c')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.jar" \
    "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.jar"
  install -Dm755 "${srcdir}/${_pkgname}.sh" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
