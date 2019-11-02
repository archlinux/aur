# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=onboarding
_author=elementary
pkgname=pantheon-${_gitname}
pkgver=1.0.1
pkgrel=1
pkgdesc="Onboarding app for new users in Pantheon Shell"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('gtk3')
makedepends=('vala' 'granite')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("f705c0e79b7bf3320cd1df57f38945f2a338e3a3d03809fc913af7efaa25afe8")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

