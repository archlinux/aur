#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=lsdisplay
pkgname=${_pkgname}-git
pkgver=0.1.1
pkgrel=1
pkgdesc="List connected displays with details and ASCII layout diagram."
arch=(any)
url="https://github.com/AGuyMarc/${_pkgname}"
license=('GPL-2.0')
groups=()
provides=("$_pkgname")
depends=("python>=3.7")
optdepends=("xrandr" "wlr-randr")
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://github.com/AGuyMarc/${_pkgname}#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1

}

package()
{

    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/bin/ "

    cp lsdiplay.py "${pkgdir}/usr/share/${_pkgname}/"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.py"
    ln -s "/usr/share/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
