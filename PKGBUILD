# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=2.0.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm' 'php' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9b2e5d2c8932c883bedbea8248f371ee6a8e0f8f5ec2f6e69b1d71b745aa92926bfc83a2c03b2676634a6583214e952c2fb91151cb8cd23672272234914459a5')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
