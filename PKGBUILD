# Maintainer: Popolon <Popolon aL popolon.org>

_pkgname=vim2pygments
pkgname=${_pkgname}-git
pkgver=r6.193aa6d
pkgrel=1
pkgdesc="Convert vim colorschemes to Pygments styles"
url="https://github.com/honza/vim2pygments"
arch=(any)
license=('BSD')
depends=("python")
conflicts=('vim2pygments')
provides=('vim2pygments')
source=("${_pkgname}::git+https://github.com/honza/${_pkgname}"
)
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}/"
    install -Dm755 vimpygments.py -t ${pkgdir}/usr/bin/
}
