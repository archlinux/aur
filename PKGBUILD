# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=onboarding
_author=elementary
pkgname=pantheon-${_gitname}
pkgver=1.2.1
pkgrel=2
pkgdesc="Onboarding app for new users in Pantheon Shell"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('gtk3' 'granite' 'libgee' 'libhandy' 'pantheon-geoclue2-agent')
makedepends=('meson' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("37edf0d48004b9e061e7998c899f44f3df4dc0848b9c362b368c73c84177d988")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

