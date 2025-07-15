#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)infomaniak(dot)com>
_pkgname=auxilium
pkgname=${_pkgname}-git
pkgver=0.1.0
pkgrel=3
pkgdesc="Tool for parse args in many shell (bash, ksh,zsh)"
arch=(any)
url="https://auxilium.spn.109"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=()
optdepends=()
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://codeberg.org/spn109/${_pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

build()
{
    cd "${srcdir}/${pkgname}" || exit 1

}

package()
{
    cd "${srcdir}/${pkgname}" || exit 1
    mkdir -p "${pkgdir}/usr/bin/ "
    mkdir -p "${pkgdir}/usr/share/auxilium/"

    cp "bin/auxilium_test" "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/auxilium_test"
    cp "share/*" "${pkgdir}/usr/share/${_pkgname}/"
}
