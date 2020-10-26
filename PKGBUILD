# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.5.7
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('dd907109c357bc2921ef6a1de92b54b98750195420dbc82df154329505d3d4855b43023887f5c4feb80b478978bbfd59b9a6bfa10ee00798f9ddb36fcd9b6bc1')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make all
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cd "${pkgdir}/usr/share/webapps/nextcloud/apps"
    tar xf "${srcdir}/polls-${pkgver}/build/artifacts/appstore/polls.tar.gz"
}
