# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=alpm_octopi_utils
_gitcommit=1e735c3a27803ca5b6470e946f9cac708143dfd9

pkgname=alpm_octopi_utils-dev
pkgver=1.0.2.r1.1e735c3
pkgrel=2
pkgdesc='Alpm utils for Octopi'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
depends=('pacman-contrib')
makedepends=('git' 'vala')
provides=('alpm_octopi_utils')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
    cd "${_githubrepo}"
    make
}

package() {
    cd "${_githubrepo}"
    install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
    install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
    install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
