# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=feedback
_author=elementary
pkgname=elementary-${_gitname}
pkgver=1.0
pkgrel=2
pkgdesc="GitHub Issue Reporter for elementary team"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('gtk3')
makedepends=('meson' 'granite' 'vala' )
optdepends=('pantheon-default-settings')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("f4600112c2552366a1f0f9f2270463c065a611f32286ba3439e14b93758dad50")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

