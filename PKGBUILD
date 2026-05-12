#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154

# Maintainer: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
# Contributor: Philippe.seraphin <philippe(dot)seraphin(at)spn109(dot)fr>
_pkgname=lsgpu
pkgname=${_pkgname}-git
pkgver=0.1.1
pkgrel=2
pkgdesc="List GPUs with details, outputs, and connected monitors."
arch=(any)
url="https://github.com/AGuyMarc/${_pkgname}"
license=('GPL-2.0')
groups=()
provides=("$_pkgname")
depends=("python>=3.7" "pciutils")
optdepends=("nvidia-utils")
makedepends=('git')
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("${pkgname}::git+https://github.com/AGuyMarc/${_pkgname}#tag=v${pkgver}")
md5sums=('SKIP')


package()
{
    install -Dm644 "${srcdir}/${_pkgname}.py" "${pkgdir}/usr/share/${_pkgname}/"
    ln -sf "/usr/share/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}s"
}
