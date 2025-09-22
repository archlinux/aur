#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=plakar_cleaner
pkgname=${_pkgname}-git
pkgver=0.2.9
pkgrel=1
pkgdesc="Tool for retain plakar backup by retention policies"
arch=(any)
url="https://spn109.fr/pc"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=("plakar>=1.0.4")
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
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/bin/ "

    cp plakar_cleaner.py "${pkgdir}/usr/share/${_pkgname}/"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/plakar_cleaner.py"
    ln -s "/usr/share/${_pkgname}/plakar_cleaner.py" "${pkgdir}/usr/bin/${_pkgname}"
}
