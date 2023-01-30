# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=localleaf
pkgname="${_pkgname}-git"
pkgver=r53.ea4cb81
pkgrel=1
pkgdesc='Easy breezy latex, monitor .tex files & build on change.'
arch=('any')
url='https://github.com/loiccoyle/localleaf'
license=('MIT')
depends=('docker')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/loiccoyle/localleaf.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    install -D -m 755 localleaf "${pkgdir}/usr/bin/localleaf"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
