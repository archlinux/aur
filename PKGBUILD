# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
#
# From purple-mattermost-git:
# Contributor: kaptoxic

pkgname=purple-mattermost
pkgver=2.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for Mattermost"
url='https://github.com/EionRobb/purple-mattermost'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=(purple-mattermost-git)
depends=('libpurple' 'json-glib' 'discount')
source=("${pkgname}.tar.gz::https://github.com/EionRobb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('326241798102346bcaabfa9647ab0740a6fc8a061c957aa09b420e84401f99c1')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
