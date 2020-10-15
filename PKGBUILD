# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.5.4
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::https://github.com/nextcloud/polls/archive/${pkgver}.tar.gz")
sha512sums=("b1454ac9a0f1ca143710e727166bb2ef647ee388dc86dc0bc13c4cc2b8533c08d4544e3b640b6880fb3399a4ab2e56e0a36100795d8c0ef8e3928c4d9326d277")

build() {
    cd "${srcdir}/polls-${pkgver}"
    make all
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cd "${pkgdir}/usr/share/webapps/nextcloud/apps"
    tar xf "${srcdir}/polls-${pkgver}/build/artifacts/appstore/polls.tar.gz"
}
