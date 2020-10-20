# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.5.5
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('28cf86ea1a0349406c96902d9add845c2d137236101bad045d6e0fb7b3392ca22f8f7c516ddabf341ed4354de4025b1402813b87350f77153a86ded753959f87')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make all
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cd "${pkgdir}/usr/share/webapps/nextcloud/apps"
    tar xf "${srcdir}/polls-${pkgver}/build/artifacts/appstore/polls.tar.gz"
}
