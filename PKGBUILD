#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=lsdisplay
pkgname=${_pkgname}-git
pkgver=0.2.5
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

package()
{
    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.py"
    ln -sf "/usr/share/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

}
