# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
_githash="71bc00f96dc83e0da3fee31b02bb6e4ad18d21d3"
pkgname="${_pkgname}-bin"
pkgver=16b
pkgrel=1
pkgdesc="A cross-platform synthesizer patch editor library"
arch=('i686' 'x86_64')
url="https://github.com/eclab/edisyn/"
license=('Apache')
depends=('java-runtime>=8')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/eclab/edisyn/raw/${_githash}/jar/edisyn.jar"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
md5sums=('cc3b699ecaf3255de334506b7442a35b'
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
