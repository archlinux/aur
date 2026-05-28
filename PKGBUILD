# Maintainer: Moritz Luedecke <moritz.luedecke@skweez.net>

pkgname=gitflow-next-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A modern reimplementation of git-flow in Go.'
arch=('i686' 'x86_64' 'aarch64')
url='https://git-flow.sh'
license=('BSD-2-Clause')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git' 'gitflow-avh')
_baseurl="https://github.com/gittower/git-flow-next/releases/download/v${pkgver}"
source_i686=("${_baseurl}/git-flow-next-v${pkgver}-linux-386.tar.gz")
source_x86_64=("${_baseurl}/git-flow-next-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_baseurl}/git-flow-next-v${pkgver}-linux-arm64.tar.gz")
sha256sums_i686=('281128839b7db8b5c38d5ecec7949c6498c9b659a50063fb54ab5964123780ed')
sha256sums_x86_64=('98a68e6ce525595dc94e3e3ac39d14f095edaad4de8a42513a294c50d9e190df')
sha256sums_aarch64=('f26e631e6fd6739006aa5a077b250a2a6c1770488832cd8bb31ea9705891c84c')

package() {
    if [ "${CARCH}" == "i686" ]; then
        _arch='386'
    elif [ "${CARCH}" == "x86_64" ]; then
        _arch='amd64'
    else
        _arch='arm64'
    fi

    install -Dm755 "${srcdir}/git-flow-v${pkgver}-linux-${_arch}" "${pkgdir}/usr/bin/git-flow"
}
