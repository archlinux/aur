# Maintainer: ramen <hendrikjschick at gmail dot com>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>
# Contributor: N.E. Neal <contact at [part of name before neal without dots] dog com>

_pkgname='bonsai.sh'
pkgname="${_pkgname}-git"
pkgver=r88.0a3ecf1
pkgrel=1
pkgdesc='bonsai tree generator written in bash'
arch=('any')
url="https://gitlab.com/jallbrit/${_pkgname}"
license=('GPL3')
depends=('bash' 'bc')
makedepends=('git')
provides=('bonsai.sh')
conflicts=('bonsai.sh')
source=("${_pkgname}::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -vDm 755 bonsai.sh -t "${pkgdir}/usr/bin/"
}
