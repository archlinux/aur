# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=3.4.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud>=21.0.0' 'nextcloud<24.0.0')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('a10d9c24191b24add6afea607efe846608e0db8c9fb3d94320c6fd0c315847b901d5c689bccbd1fd42274cffe0efa6ce7759e2502c63e193fdf3392c138e12bb')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make -j1
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
