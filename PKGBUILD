# Maintainer: adytzu2007 <adybac "at" gmail {dot} com>

_pkgname=pipework
pkgname=${_pkgname}-git
_pkgver=0.1
pkgver=0.1.210.12998f3
pkgrel=1
pkgdesc="Software-Defined Networking for Linux Containers"
arch=('i686' 'x86_64')
license=('apache')
url='https://github.com/jpetazzo/pipework.git'

depends=('bash' 'iproute2')
makedepends=('git')

source=("${_pkgname}::git+https://github.com/jpetazzo/pipework.git#branch=master")
md5sums=("SKIP")

package()
{
    install -D -m0755 "${srcdir}/${_pkgname}/pipework" "${pkgdir}/usr/bin/pipework"
}

pkgver()
{
    cd "${srcdir}/${_pkgname}"
    printf "${_pkgver}.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
