# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=whoneeds
pkgname=${_pkgname}-git
pkgver=r6.ca4e025
pkgrel=1
pkgdesc="A fast whoneeds implemention in Python for Arch Linux"
arch=('any')
url="https://gist.github.com/lilydjwg/69111965e237fdb67d1378703173709f"
license=('unkown')
depends=('python' 'pyalpm')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}"::'git+https://gist.github.com/69111965e237fdb67d1378703173709f.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 '_whoneeds' "${pkgdir}/usr/share/zsh/site-functions/_whoneeds"
}

