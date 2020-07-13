# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=fzwal-git
_pkgname=${pkgname%-git}
pkgver=r3.81149c3
pkgrel=1
pkgdesc="A pywal theme picker with live preview based on fzf."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('python-pywal' 'fzf')
optdepends=()
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/fzwal.sh" "${pkgdir}/usr/bin/fzwal"
}
