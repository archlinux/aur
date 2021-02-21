_pkgname='dotlink'
pkgname="${_pkgname}-git"
pkgver=r16.0a869dd
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://github.com/joel-porquet/dotlink"
arch=('any')
license=('GPL2')
depends=('bash')
makedepends=('git' 'make')

source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}
