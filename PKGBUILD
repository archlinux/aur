# Maintainer: Isaac Freund <ifreund@ifreund.xyz>
# Contributor: N.E. Neal <contact at [part of name before neal without dots] dog com>

_pkgname='bonsai.sh'
pkgname="${_pkgname}-git"
pkgver=r84.6c3812b
pkgrel=2
pkgdesc='bonsai tree generator written in bash'
arch=('any')
url="https://gitlab.com/jallbrit/${_pkgname}"
license=('GPL3')
depends=('bash' 'bc')
makedepends=('git')
provides=('bonsai.sh')
conflicts=('bonsai.sh')
source=("${_pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -vDm 755 bonsai.sh -t "${pkgdir}/usr/bin/"
}
