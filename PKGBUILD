#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=dispositio
pkgname=${_pkgname}-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Tool for displaying tabula data r (from CSV, JSON or YAML) in terminal (or markdown or Texttile)> You can use it as a library."
arch=(any)
url="https://dispositio.spn.109"
license=('Apache-2')
groups=()
provides=("$_pkgname")
depends=("auxilium-git")
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

    cp -R ./* "${pkgdir}/usr/share/${_pkgname}/"
    ln -s "${pkgdir}/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
