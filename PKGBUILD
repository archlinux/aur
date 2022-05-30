# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
#
# From purple-mattermost-git:
# Contributor: kaptoxic

pkgname=purple-mattermost
pkgver=2.1
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for Mattermost"
url='https://github.com/EionRobb/purple-mattermost'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=(purple-mattermost-git)
depends=('libpurple' 'json-glib' 'discount')
source=("${pkgname}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2b2bf4d102d7baa8af9ac152c27d7c32a8932b7fa4112dbad9daad5bea81cc76')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
